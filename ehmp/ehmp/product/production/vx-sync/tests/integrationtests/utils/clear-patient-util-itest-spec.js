'use strict';

require('../../../env-setup');

var clearPatientUtil = require(global.VX_UTILS + 'clear-patient-util');

var log = require(global.VX_DUMMIES + '/dummy-logger');
// NOTE: be sure next lines are commented out before pushing
// var logUtil = require(global.VX_UTILS + 'log');
// log = logUtil._createLogger({
// 	name: 'test',
// 	level: 'debug',
// 	child: logUtil._createLogger
// });

var _ = require('underscore');
var async = require('async');
var request = require('request');

var config = require(global.VX_ROOT + 'worker-config');
var host = require(global.VX_INTTESTS + 'test-config');
var val = require(global.VX_UTILS + 'object-utils').getProperty;

var JdsClient = require(global.VX_SUBSYSTEMS + 'jds/jds-client');
var solrSmartClient = require('solr-smart-client');
var VistaClient = require(global.VX_SUBSYSTEMS + 'vista/vista-client');
var HdrClient = require(global.VX_SUBSYSTEMS + 'hdr/hdr-client');
var VxSyncForeverAgent = require(global.VX_UTILS + 'vxsync-forever-agent');

/*
	*** Note ***
	This test requires a patient to be synced before it can test the utility.
	The patient used here is 9E7A;19.
	This patient will be unsynced after the test runs.
 */

describe('clearPatientUtil', function() {
	it('clearPatient', function() {

		var pid = '9E7A;19';
		var identifiers;
		var jpid;

		var environment = {
			vistaClient: new VistaClient(log, log, config, null),
			jds: new JdsClient(log, log, config),
			solr: solrSmartClient.initClient(config.solrClient.core, config.solrClient.zooKeeperConnection, log, new VxSyncForeverAgent()),
			hdrClient: new HdrClient(log, log, config)
		};

		var syncRequestError;
		var syncRequestResponse;
		var syncRequestComplete = false;
		var syncIsComplete = false;
		var syncStatusCalledCounter = 0;

		//---------------------------------------------------------------------------------------------------
		// This function checks the sync status to see if there is nothing in progress and there are no
		// open jobs.  If that is the case, it will set syncIsComplete to true.
		//
		// callback: The function to call when the check is done.
		//---------------------------------------------------------------------------------------------------
		function checkSyncComplete(callback) {
			log.debug('clear-patient-util-itest-spec.checkSyncComplete: Entered method.');
			var syncStatusCallComplete = false;
			var syncStatusCallError;
			var syncStatusCallResponse;
			runs(function() {
				var options = {
					url: config.syncRequestApi.protocol + '://' + host + ':' + config.syncRequestApi.port + config.syncRequestApi.patientStatusPath + '?pid=' + pid,
					method: 'GET'
				};

				syncStatusCalledCounter++;
				log.debug('clear-patient-util-itest-spec.checkSyncComplete: Retrieving status: syncStatusCalledCounter: %s; options: %j', syncStatusCalledCounter, options);
				request.get(options, function(error, response, body) {
					log.debug('clear-patient-util-itest-spec.checkSyncComplete: Retrieving status - Call back called: error: %j, response: %j, body: %j', error, response, body);
					expect(response).toBeTruthy();
					expect(val(response, 'statusCode')).toBe(200);
					expect(body).toBeTruthy();

					var syncStatusData;
					try {
						syncStatusData = JSON.parse(body);
					} catch (parseError) {}

					log.debug('clear-patient-util-itest-spec.checkSyncComplete: Retrieving status - Call back called: syncStatusData: %j', syncStatusData);
					expect(syncStatusData).toBeTruthy();
					if (syncStatusData && (_.isObject(syncStatusData.syncStatus)) && (_.isEmpty(syncStatusData.syncStatus.inProgress)) &&
						(_.isArray(syncStatusData.jobStatus)) && (_.isEmpty(syncStatusData.jobStatus))) {
						syncIsComplete = true;
					}

					syncStatusCallError = error;
					syncStatusCallResponse = response;
					syncStatusCallComplete = true;
					return callback();
				});
			});

			waitsFor(function() {
				return syncStatusCallComplete;
			}, 'Timed out waiting for syncRequest.', 10000);
		}

		//------------------------------------------------------------------------------------------------------
		// Returns the value of syncIsComplete.
		//
		// returns TRUE if the sync is complete.  False if it is not.
		//------------------------------------------------------------------------------------------------------
		function isSyncComplete() {
			log.debug('clear-patient-util-itest-spec.isSyncComplete: Entered method.  syncIsComplete: %j', syncIsComplete);
			return syncIsComplete;
		}


		//------------------------------------------------------------------------------------------------------
		// Test code starts here....
		//------------------------------------------------------------------------------------------------------
		runs(function() {
			var options = {
				url: config.syncRequestApi.protocol + '://' + host + ':' + config.syncRequestApi.port + config.syncRequestApi.patientSyncPath + '?pid=' + pid,
				method: 'GET'
			};

			log.debug('clear-patient-util-itest-spec: Sync Request.  options: %j', options);
			request.get(options, function(error, response, body) {
				log.debug('clear-patient-util-itest-spec: Sync Request call back called.  error: %j; response: %j, body: %j', error, response, body);
				syncRequestError = error;
				syncRequestResponse = response;
				expect(val(response, 'statusCode')).toBe(202);
				syncRequestComplete = true;
			});
		});

		waitsFor(function() {
			return syncRequestComplete;
		}, 'Timed out waiting for syncRequest.', 10000);

		// Need to wait for the sync to complete.
		//----------------------------------------
		runs(function() {
			log.debug('clear-patient-util-itest-spec: Starting async.doWhilst.');
			async.doUntil(checkSyncComplete, isSyncComplete, function(error) {
				expect(error).toBeFalsy();
				log.debug('clear-patient-util-itest-spec: async.doWhilst call back called.  error: %j', error);
			});
		});

		waitsFor(function() {
			return syncIsComplete;
		}, 'Timed out waiting for sync to complete.', 60000);

		// Before we call clearPatient we must get the patient identifiers
		//----------------------------------------------------------------
		var getIdentifiersComplete = false;
		runs(function() {
			log.debug('clear-patient-util-itest-spec: Done Syncing syncStatusCalledCounter: %s; ', syncStatusCalledCounter);
			environment.jds.getPatientIdentifierByPid(pid, function(error, response, result) {
				expect(error).toBeFalsy();
				expect(response).toBeTruthy();
				expect(result).toBeTruthy();
				expect(val(result, 'patientIdentifiers')).toBeTruthy();
				expect(val(result, 'jpid')).toBeTruthy();

				identifiers = result.patientIdentifiers;
				jpid = result.jpid;
				getIdentifiersComplete = true;
			});
		});

		waitsFor(function() {
			return getIdentifiersComplete;
		}, 'waiting to get identifiers from JDS', 10000);

		// Now we can test clearPatient
		//-----------------------------
		var clearPatientDone = false;
		runs(function() {
			log.debug('clear-patient-util-itest-spec: now testing clearPatient');
			clearPatientUtil.clearPatient(log, config, environment, false, identifiers, jpid, function(error) {
				expect(error).toBeFalsy();
				clearPatientDone = true;
			});
		});

		waitsFor(function() {
			return clearPatientDone;
		}, 'waiting for clearPatientUtil.clearPatient', 10000);

		// Double check with JDS that the patient has been unsynced
		//---------------------------------------------------------
		var statusCheckDone = false;
		runs(function() {
			log.debug('clear-patient-util-itest-spec: verifying that patient was unsynced');
			environment.jds.getSyncStatus({
				value: pid
			}, function(error, response) {
				expect(error).toBeFalsy();
				expect(response).toBeTruthy();
				expect(val(response, 'statusCode')).toEqual(404);
				statusCheckDone = true;
			});
		});

		waitsFor(function() {
			return statusCheckDone;
		}, 'waiting to verify patient was unsynced', 10000);
	});

});