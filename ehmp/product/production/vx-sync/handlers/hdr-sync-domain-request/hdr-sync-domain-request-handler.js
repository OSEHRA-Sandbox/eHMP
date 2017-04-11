'use strict';

var _ = require('underscore');
var jobUtil = require(global.VX_UTILS + 'job-utils');
var errorUtil = require(global.VX_UTILS + 'error');
var idUtil = require(global.VX_UTILS + 'patient-identifier-utils');
var request = require('request');
var format = require('util').format;
var inspect = require(global.VX_UTILS + 'inspect');
var uuid = require('node-uuid');
var VxSyncForeverAgent = require(global.VX_UTILS+'vxsync-forever-agent');

function handle(log, config, environment, job, handlerCallback) {
    log.debug('hdr-sync-domain-request-handler.handle: Received request to HDR (%s) %j', job.dataDomain, job);

    if (!job.patientIdentifier || !job.patientIdentifier.type || job.patientIdentifier.type !== 'pid' || !/^HDR;/.test(job.patientIdentifier.value)) {
        log.error('hdr-sync-domain-request-handler.handle: Could not find ICN for HDR Sync request');
        return setTimeout(handlerCallback, 0, errorUtil.createFatal('hdr-sync-domain-request-handler.handle: Expected HDR pid which contains ICN as patient id, but it was not found.'));
    }

    var domainConfig = getDomainConfiguration(log, config, job);
    if (domainConfig === null) {
        log.warn('hdr-sync-domain-request-handler.handle: No configuration for domain for job: %j', job);
        return setTimeout(handlerCallback, 0, errorUtil.createFatal('hdr-sync-domain-request-handler.handle: No configuration for domain'));
    }

    log.debug('hdr-sync-domain-request-handler.handle: sending domain request to HDR for pid: %s; domain: %s; domainConfig: %j.', job.patientIdentifier.value, job.dataDomain, domainConfig);
    var metricsObj = {'timer':'start','process':uuid.v4(),'pid':job.patientIdentifier.value,'domain':job.dataDomain,'subsystem':'HDR','action':'sync domain','jobId':job.jobId,'rootJobId':job.rootJobId,'jpid':job.jpid};
    environment.metrics.debug('HDR domain sync',metricsObj);
    metricsObj.timer='stop';
    request(domainConfig, function(error, response, body) {
        log.debug('hdr-sync-domain-request-handler,handle: Received domain response.  error: %s and body: %j; ', error, body);
        if ((!error) && (response) && (response.statusCode === 200 || response.statusCode === 204)) { //204 checked for domains that don't have data for that patient
            environment.metrics.debug('HDR domain sync',metricsObj);
            log.debug('hdr-sync-domain-request-handler.handle: response body (string form): %s', body);
            var jsonBody;
            if (response.statusCode===200){
                if (typeof body !== 'object') {

                    try {
                        jsonBody = JSON.parse(body);
                        log.debug('hdr-sync-domain-request-handler.handle: %s', body);
                    } catch (e) {
                        log.error('hdr-sync-domain-request-handler.handle: Failed to parse JSON.  body: %s', body);
                        return handlerCallback(errorUtil.createFatal('Failed to parse HDR response.'));
                    }
                } else {
                    log.debug('hdr-sync-domain-request-handler.handle: was an object - no parsing necessary.', body);
                    jsonBody = body;
                }
            }
            else{ // for 204, no content returned, so log with empty body
                log.debug(format('hdr-sync-domain-request-handler.handle: Unable to retrieve HDR sync for %s domain %s because there is no content', inspect(job.patientIdentifier), job.dataDomain));
                jsonBody={data:{}};
            }
            var jobToPublish;
            if (_.isEmpty(jsonBody)) {
                log.warn('hdr-sync-domain-request-handler.handle: HDR response empty');
                return handlerCallback(null, errorUtil.createFatal('No Valid Data Found'));
            } else if (!_.isUndefined(jsonBody.sites)) {
                jobToPublish = _.map(jsonBody.sites, function(siteData) {
                    return jobUtil.createHdrDomainXformVpr(job.patientIdentifier, job.dataDomain, siteData, job.requestStampTime, job);
                });
            } else {
                log.warn('hdr-sync-domain-request-handler.handle: HDR record in bad format, dealing with it');
                jobToPublish = jobUtil.createHdrDomainXformVpr(job.patientIdentifier, job.dataDomain, jsonBody, job.requestStampTime, job);
            }
            log.debug('hdr-sync-domain-request-handler.handle: Publish: %j and json is %j', job, jsonBody);
            environment.publisherRouter.publish(jobToPublish, handlerCallback);

        } else {
            environment.metrics.debug('HDR domain sync in Error', metricsObj);
            var statusCode;
            if ((response) && (response.statusCode)) {
                statusCode = response.statusCode;
            }
            var errorMessage = format('hdr-sync-domain-request-handler.handle: Unable to retrieve HDR sync for domain %s via Soap Handler. patient: %s, error: %s, response.statusCode: %s', job.dataDomain, inspect(job.patientIdentifier), inspect(error), statusCode);
            log.error(errorMessage);
            return handlerCallback(errorMessage);
        }
    });
}

function getDomainConfiguration(log, config, job) {
    log.debug('hdr-sync-domain-request-handler.getDomainConfiguration: getDomainConfiguration: ');
    var query = {};
    query.icn = idUtil.extractIcnFromPid(job.patientIdentifier.value, config);

    log.debug('hdr-sync-domain-request-handler.getDomainConfiguration: value: %s and icn: %s', job.patientIdentifier.value, query.icn);

    if (!config.hdr[job.dataDomain]) {
        log.error('hdr-sync-domain-request-handler.getDomainConfiguration: Missing configuration for data domain: ' + job.dataDomain);
        return null;
    }

    var domainConfig = _.extend({
        'qs': query
    }, config.hdr[job.dataDomain]);
    domainConfig = _.defaults(domainConfig, config.hdr.defaults);
    log.debug('domainConfig: %j', domainConfig);
    var url = format('%s://%s:%s%s', domainConfig.protocol || 'http', domainConfig.host, domainConfig.port, domainConfig.path);
    log.debug('URL: %s with query: %j', url, query);
    domainConfig.url = url;
    domainConfig.agentClass = VxSyncForeverAgent;

    return domainConfig;
}

module.exports = handle;
module.exports._getDomainConfiguration = getDomainConfiguration;