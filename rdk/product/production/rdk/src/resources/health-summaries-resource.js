'use strict';

var auditUtil = require('../utils/audit');
var RpcClient = require('vista-js').RpcClient;
var rdk = require('../core/rdk');
var getVistaRpcConfiguration = require('../utils/rpc-config').getVistaRpcConfiguration;
var async = require('async');
var _ = require('lodash');
var HEALTHSUMREPORTLISTSTARTTAG = '[HEALTH SUMMARY TYPES]';
var HEALTHSUMREPORTLISTENDTAG = '$$END';
var REPORTLISTRPC = 'ORWRP REPORT LISTS';
var REPORTCONTENTRPC = 'ORWRP REPORT TEXT';

function getPatientSites(req) {
    var allSites = _.get(req, 'interceptorResults.patientIdentifiers.allSites');
    if (!allSites) {
        return;
    }

    var vistaSiteCollection = req.app.config.vistaSites;
    var sitesInfo = [];
    var patientVistaSiteKeys = _.map(allSites, function (pid) {
        return pid.substring(0, pid.indexOf(';'));
    });

    _.each(patientVistaSiteKeys, function (site) {
        if (_.has(vistaSiteCollection, site)) {
            _.each(vistaSiteCollection[site].division, function(division) {
                sitesInfo.push({
                    'siteKey': site,
                    'facilityCode': division.id,
                    'facilityName': division.name,
                    'isPrimary': true
                });
                //TODO: This is to work around Panorama and Kodak as their facility Codes are same. This should not impact beyond Development Environment
                // Hard Coding facility Code for PANORAMA
                if (site === '9E7A') {
                    sitesInfo.facilityCode = 'TST1';
                    //Hard Coding facility Code for KODAK
                } else if (site === 'C877') {
                    sitesInfo.facilityCode = 'TST2';
                }
            });
        } else {
            sitesInfo.push({
                'facilityCode': site,
                'facilityName': site,
                'isPrimary': false
            });
        }
    });

    return sitesInfo;
}

function getReportListForAllSites(req, res, sites, callbackObj) {
    var asyncTasks = [],
        errorObj = {},
        secondarySites = [];

    // Loop through all sites
    sites.forEach(function (site) {
        if (site.isPrimary) {
            asyncTasks.push(function (callback) {

                var msg = 'Calling ' + REPORTLISTRPC + ' at site ' + site.facilityName + ' (' + site.facilityCode + ')';
                auditUtil.addAdditionalMessage(req, 'healthSummaries', msg);

                RpcClient.callRpc(req.logger, getVistaRpcConfiguration(req.app.config, req.session.user), REPORTLISTRPC, function (error, result) {

                    if (error) {

                        req.logger.error({error: error}, 'Error during Health Summaries Report List Request');
                        errorObj = {
                            'statuscode': rdk.httpstatus.internal_server_error,
                            'error': error.toString()
                        };

                        callback(errorObj, null);

                    } else if (typeof result === 'string') {

                        req.logger.info('REPORTS', result);
                        var reportsArray = result.split('\r\n'),
                            historySummaryReportIndex = _.indexOf(reportsArray, HEALTHSUMREPORTLISTSTARTTAG) + 1,
                            historySummaryReports = [],
                            loop,
                            report;
                        for (loop = historySummaryReportIndex; loop < reportsArray.length; loop++) {
                            //Ignore Adhoc Report for now as it is not supported.
                            if (reportsArray[loop].toLowerCase().indexOf('adhoc') > -1) {
                                continue;
                            }
                            if (reportsArray[loop] === HEALTHSUMREPORTLISTENDTAG) {
                                break;
                            }
                            report = reportsArray[loop].split('^');
                            historySummaryReports.push({
                                'siteKey': site.siteKey,
                                'facilityCode': site.facilityCode,
                                'isPrimary': true,
                                'facilityName': site.facilityName,
                                'hsReport': report[1],
                                'reportID': report[0].replace('h', '')
                            });

                        }
                        callback(null, _.sortBy(historySummaryReports, 'hsReport'));

                    } else {

                        errorObj = {
                            'statuscode': rdk.httpstatus.not_found,
                            'error': 'NO REPORT LIST'
                        };

                        callback(errorObj, null);
                    }

                });
            });
        }
    });

    try {
        //running all these rpc calls to different sites in parallel
        async.parallel(asyncTasks, function (err, data) {
            req.logger.info('SITES INFO', data);

            var consolidatedList = [];
            _.each(secondarySites, function (secondarySite) {
                consolidatedList.push(secondarySite);
            });
            // Loop through all sites and consolidate the list
            _.each(data, function (reportListData) {
                _.each(reportListData, function (report) {
                    consolidatedList.push(report);
                });
            });

            callbackObj(consolidatedList);
        });
    } catch (e) {

        errorObj = {
            'statuscode': rdk.httpstatus.internal_server_error,
            'error': e.toString()
        };
        callbackObj(errorObj);

    }

}

function getSitesInfoFromPatientData(req, res) {
    if (_.isUndefined(req.param('pid'))) {
        return res.status(rdk.httpstatus.internal_server_error).rdkSend('Patient ID is required');
    }

    var sites = getPatientSites(req);
    if (_.isUndefined(sites)) {
        return res.status(rdk.httpstatus.not_found).rdkSend('Bad Patient ID');
    }

    req.logger.info(sites);
    getReportListForAllSites(req, res, sites, function (sitesInfo) {
        if (sitesInfo.error) {
            res.status(sitesInfo.statuscode).rdkSend(sitesInfo.error);
        } else {
            res.status(rdk.httpstatus.ok).rdkSend(sitesInfo);
        }
    });
}

function getReportContentByReportID(req, res) {
    req.logger.info('PARAMS', req.params, _.isUndefined(req.param('site')));
    if (_.isUndefined(req.param('pid'))) {
        return res.status(rdk.httpstatus.bad_request).rdkSend('Patient Id is missing');
    } else if (_.isUndefined(req.param('site.code'))) {
        req.logger.info('SITE UNDEFINED');
        return res.status(rdk.httpstatus.bad_request).rdkSend('Site Id is missing');
    } else if (_.isUndefined(req.param('id'))) {
        return res.status(rdk.httpstatus.bad_request).rdkSend('Report Id is missing');

    } else {
        var pid = req.param('pid');
        var reportId = req.param('id');
        var params = [];
        var errorObj = {};

        //Params
        params[0] = '0;' + pid;
        params[1] = '1;1~';
        params[2] = reportId;
        params[3] = '';
        params[4] = '';
        params[5] = '0';
        params[6] = '0';

        if (reportId.indexOf(';') === -1) {
            res.status(rdk.httpstatus.bad_request).rdkSend('Report Id is not in correct format');
            return;
        }

        RpcClient.callRpc(req.logger, getVistaRpcConfiguration(req.app.config, req.session.user), REPORTCONTENTRPC, params, function (error, result) {

            if (error) {

                req.logger.debug({error: error}, 'Error during Health Summaries Report Content Request');
                errorObj = {
                    'statuscode': rdk.httpstatus.internal_server_error,
                    'error': 'Error Getting Report Content'
                };

                res.status(rdk.httpstatus.internal_server_error).rdkSend(errorObj);

            } else if (typeof result === 'string') {

                req.logger.info('REPORT CONTENT', result);
                if (result.indexOf('Report not Available') > -1) {
                    errorObj = {
                        'statuscode': rdk.httpstatus.not_found,
                        'error': 'Report Not Available'
                    };
                    res.status(rdk.httpstatus.not_found).rdkSend(errorObj);
                } else if (result.indexOf('not found on remote system') > -1) {
                    errorObj = {
                        'statuscode': rdk.httpstatus.not_found,
                        'error': 'Report Not Found'
                    };
                    res.status(rdk.httpstatus.not_found).rdkSend(errorObj);
                } else {
                    var reportTitle = reportId.split(';');
                    var data = {
                        reportID: reportTitle[0],
                        hsReport: reportTitle[1],
                        totalLength: result.length,
                        detail: result
                    };
                    res.status(rdk.httpstatus.ok).rdkSend(data);
                }
            } else {

                errorObj = {
                    'statuscode': rdk.httpstatus.not_found,
                    'error': 'No Report Content Found.'
                };

                res.status(rdk.httpstatus.not_found).rdkSend(errorObj);
            }

        });

    }
}


function getResourceConfig() {
    return [{
            name: 'healthsummaries-getSitesInfoFromPatientData',
            path: '/sites',
            get: getSitesInfoFromPatientData,
            requiredPermissions: ['read-vista-health-summary'],
            isPatientCentric: false,
            outerceptors: [],
            subsystems: ['jdsSync']
    },
        {
            name: 'healthsummaries-getReportContentByReportID',
            path: '/reports',
            get: getReportContentByReportID,
            requiredPermissions: ['read-vista-health-summary'],
            isPatientCentric: false
    }];
}


module.exports.getResourceConfig = getResourceConfig;
