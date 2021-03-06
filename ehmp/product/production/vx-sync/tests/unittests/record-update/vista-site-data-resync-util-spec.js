'use strict';

require('../../../env-setup');

var VistaResyncUtil = require(global.VX_ROOT + 'record-update/utils/vista-site-data-resync-util');
var log = require(global.VX_DUMMIES + '/dummy-logger');
var JdsClientDummy = require(global.VX_DUMMIES + 'jds-client-dummy');
var _ = require('underscore');

// Be sure next line is commented out before pushing
// log = require('bunyan').createLogger({
//     name: 'record-update-spec',
//     level: 'debug'
// });

var syncStatus1 = {
    'completedStamp': {
        'icn': '10108V420871',
        'lastAccessTime': '',
        'sourceMetaStamp': {
            '2939': {
                'domainMetaStamp': {
                    'allergy': {
                        'domain': 'allergy',
                        'eventCount': 1,
                        'eventMetaStamp': {
                            'urn:va:allergy:2939:3:546': {
                                'stampTime': 20090317200936,
                                'stored': true
                            }
                        },
                        'stampTime': 20160408113835,
                        'storedCount': 1,
                        'syncCompleted': true
                    },
                    'appointment': {
                        'domain': 'appointment',
                        'eventCount': 1,
                        'eventMetaStamp': {
                            'urn:va:appointment:2939:3:546': {
                                'stampTime': 20090317200936,
                                'stored': true
                            }
                        },
                        'stampTime': 20160408113835,
                        'storedCount': 1,
                        'syncCompleted': true
                    },
                    'consult': {
                        'domain': 'consult',
                        'eventCount': 1,
                        'eventMetaStamp': {
                            'urn:va:consult:2939:3:546': {
                                'stampTime': 20090317200936,
                                'stored': true
                            }
                        },
                        'stampTime': 20160408113835,
                        'storedCount': 1,
                        'syncCompleted': true
                    },
                },
                'localId': '3',
                'pid': '2939;3',
                'stampTime': 20160408113843,
                'syncCompleteAsOf': 20160411095621,
                'syncCompleted': true
            },
            'SITE': {
                'domainMetaStamp': {
                    'allergy': {
                        'domain': 'allergy',
                        'eventCount': 4,
                        'eventMetaStamp': {
                            'urn:va:allergy:SITE:3:751': {
                                'stampTime': 20050317200936,
                                'stored': true
                            },
                            'urn:va:allergy:SITE:3:874': {
                                'stampTime': 20071217151354,
                                'stored': true
                            },
                            'urn:va:allergy:SITE:3:986': {
                                'stampTime': 20150706153033,
                                'stored': true
                            }
                        },
                        'stampTime': 20160408113842,
                        'storedCount': 4,
                        'syncCompleted': true
                    }
                },
                'localId': '3',
                'pid': 'SITE;3',
                'stampTime': 20160408113843,
                'syncCompleteAsOf': 20160411095621,
                'syncCompleted': true
            },
            'VLER': {
                'domainMetaStamp': {
                    'patient': {
                        'domain': 'patient',
                        'eventCount': 1,
                        'stampTime': 16051105010000,
                        'storedCount': 1,
                        'syncCompleted': true
                    },
                    'vlerdocument': {
                        'domain': 'vlerdocument',
                        'eventCount': 11,
                        'stampTime': 20160408113843,
                        'storedCount': 11,
                        'syncCompleted': true
                    }
                },
                'localId': '10108V420871',
                'pid': 'VLER;10108V420871',
                'stampTime': 20160408113843,
                'syncCompleteAsOf': 20160411095621,
                'syncCompleted': true
            }
        }
    }
};

var syncStatus2 = {
    'completedStamp': {
        'icn': '10110V004877',
        'lastAccessTime': 20160412140034,
        'sourceMetaStamp': {
            '2939': {
                'domainMetaStamp': {
                    'patient': {
                        'domain': 'patient',
                        'eventCount': 1,
                        'stampTime': 16051105010000,
                        'storedCount': 1,
                        'syncCompleted': true
                    }
                },
                'localId': 21,
                'pid': '2939;21',
                'stampTime': 16051105010000,
                'syncCompleteAsOf': 20160412140317,
                'syncCompleted': true
            },
            'SITE': {
                'domainMetaStamp': {
                    'allergy': {
                        'domain': 'allergy',
                        'eventCount': 3,
                        'eventMetaStamp': {
                            'urn:va:allergy:SITE:3:546': {
                                'stampTime': 20060317200936,
                                'stored': true
                            }
                        },
                        'stampTime': 20160412135639,
                        'storedCount': 3,
                        'syncCompleted': true
                    },
                    'appointment': {
                        'domain': 'appointment',
                        'eventCount': 2,
                        'eventMetaStamp': {
                            'urn:va:appointment:SITE:3:546': {
                                'stampTime': 20060317200936,
                                'stored': true
                            }
                        },
                        'stampTime': 20160412135641,
                        'storedCount': 56,
                        'syncCompleted': true
                    },
                    'consult': {
                        'domain': 'appointment',
                        'eventCount': 2,
                        'stampTime': 20160412135641,
                        'storedCount': 56,
                        'syncCompleted': true
                    },
                    'vital': {
                        'domain': 'vital',
                        'eventCount': 2,
                        'stampTime': 20160412135641,
                        'storedCount': 56,
                        'syncCompleted': true
                    }
                },
                'localId': 1,
                'pid': '9E7a;1',
                'stampTime': 16051105010000,
                'syncCompleteAsOf': 20160412140317,
                'syncCompleted': true
            }
        }
    }
};

var simpleSyncStatus1 = {
    'completedStamp': {
        'icn': '10108V420871',
        'lastAccessTime': 20160412104227,
        'sourceMetaStamp': {
            'SITE': {
                'domainMetaStamp': {
                    'allergy': {
                        'domain': 'allergy',
                        'eventCount': 4,
                        'stampTime': 20160412101225,
                        'storedCount': 4,
                        'syncCompleted': true
                    },
                    'appointment': {
                        'domain': 'appointment',
                        'eventCount': 49,
                        'stampTime': 20160412101225,
                        'storedCount': 49,
                        'syncCompleted': true
                    },
                    'consult': {
                        'domain': 'consult',
                        'eventCount': 5,
                        'stampTime': 20160412101225,
                        'storedCount': 5,
                        'syncCompleted': true
                    }
                },
                'localId': 3,
                'pid': 'SITE;3',
                'stampTime': 20160412101240,
                'syncCompleteAsOf': 20160412143126,
                'syncCompleted': true
            }
        }
    }
};

var allergyDomainData1 = [{
    'data': 'someData',
    'pid': '2939;19',
    'stampTime': 20061217151354,
    'uid': 'urn:va:allergy:2939:19:106'
}, {
    'data': 'someData',
    'pid': 'SITE;3',
    'stampTime': 20160303154108,
    'uid': 'urn:va:allergy:SITE:3:751'
}];

var allergyDomainData2 = [{
    'data': 'someData',
    'pid': 'SITE;8',
    'uid': 'urn:va:allergy:SITE:8:751',
    'stampTime': 20061217151354,
}];

var consultDomainData1 = [{
    'data': 'someData',
    'pid': 'SITE;8',
    'uid': 'urn:va:consult:SITE:8:751',
    'stampTime': 20061217151354
}];

var updateConfig = {};

describe('vista-site-date-resync-util.js', function() {
    describe('retrievePatientList()', function() {
        it('Normal path', function() {
            var patientListSITE = {
                'data': {
                    'items': ['SITE;3', 'SITE;123', 'SITE;234']
                }
            };

            var patientListXABY = {
                'data': {
                    'items': ['XABY;4', 'XABY;345', 'XABY;456']
                }
            };

            var jdsClient = new JdsClientDummy(log, {});
            jdsClient._setResponseData(null, [{
                statusCode: 200
            }, {
                statusCode: 200
            }], [patientListSITE, patientListXABY]);

            var dummyVistaClient = {};

            var resyncUtil = new VistaResyncUtil(log, dummyVistaClient, jdsClient, updateConfig);

            var done = false;

            runs(function() {
                resyncUtil.retrievePatientList(['SITE', 'XABY'], null, function(error, result) {
                    done = true;
                    expect(error).toBeFalsy();
                    expect(result).toContain('SITE;3');
                    expect(result).toContain('SITE;123');
                    expect(result).toContain('SITE;234');
                    expect(result).toContain('XABY;4');
                    expect(result).toContain('XABY;345');
                    expect(result).toContain('XABY;456');
                });
            });

            waitsFor(function() {
                return done;
            });
        });

        it('Error path: No pids found', function() {
            var jdsClient = new JdsClientDummy(log, {});
            jdsClient._setResponseData(null, [{
                statusCode: 200
            }, {
                statusCode: 200
            }], [{
                data: {
                    items: []
                }
            }, {
                data: {
                    items: []
                }
            }]);

            var dummyVistaClient = {};

            var resyncUtil = new VistaResyncUtil(log, dummyVistaClient, jdsClient, updateConfig);

            var done = false;

            runs(function() {
                resyncUtil.retrievePatientList(['SITE', 'XABY'], null, function(error, result) {
                    done = true;
                    expect(error).toBeTruthy();
                    expect(result).toBeFalsy();
                });
            });

            waitsFor(function() {
                return done;
            });
        });

        it('Error path: Error from JDS', function() {
            var jdsClient = new JdsClientDummy(log, {});
            jdsClient._setResponseData({
                error: 'ERROR!'
            }, {
                statusCode: 500
            }, null);

            var dummyVistaClient = {};

            var resyncUtil = new VistaResyncUtil(log, dummyVistaClient, jdsClient, updateConfig);

            var done = false;

            runs(function() {
                resyncUtil.retrievePatientList(['SITE'], null, function(error, result) {
                    done = true;
                    expect(error).toBeTruthy();
                    expect(result).toBeFalsy();
                });
            });

            waitsFor(function() {
                return done;
            });
        });

        it('Error path: Unexpected response from JDS', function() {
            var jdsClient = new JdsClientDummy(log, {});
            jdsClient._setResponseData(null, {
                statusCode: 404
            }, null);

            var dummyVistaClient = {};

            var resyncUtil = new VistaResyncUtil(log, dummyVistaClient, jdsClient, updateConfig);

            var done = false;

            runs(function() {
                resyncUtil.retrievePatientList(['SITE'], null, function(error, result) {
                    done = true;
                    expect(error).toBeTruthy();
                    expect(result).toBeFalsy();
                });
            });

            waitsFor(function() {
                return done;
            });
        });
    });

    describe('retrievePatientSyncDomains()', function() {
        it('Normal path: updateTime provided', function() {
            var jdsClient = new JdsClientDummy(log, {});
            var dummyVistaClient = {};
            var resyncUtil = new VistaResyncUtil(log, dummyVistaClient, jdsClient, updateConfig);
            var done = false;

            jdsClient._setResponseData([null, null], [{
                statusCode: 200
            }, {
                statusCode: 200
            }], [syncStatus1, syncStatus2]);

            runs(function() {
                resyncUtil.retrievePatientSyncDomains('20071217151553', ['allergy', 'appointment', 'consult', 'vital'], ['SITE;3', 'SITE;8'], function(error, result) {
                    done = true;
                    expect(error).toBeFalsy();
                    expect(result).toEqual({
                        'SITE;3': ['allergy'],
                        'SITE;8': ['allergy', 'appointment']
                    });
                });
            });

            waitsFor(function() {
                return done;
            });
        });

        it('Normal path: updateTime omitted', function() {
            var jdsClient = new JdsClientDummy(log, {});
            var dummyVistaClient = {};
            var resyncUtil = new VistaResyncUtil(log, dummyVistaClient, jdsClient, updateConfig);
            var done = false;

            jdsClient._setResponseData([null], [{
                statusCode: 200
            }], [simpleSyncStatus1]);

            runs(function() {
                resyncUtil.retrievePatientSyncDomains(null, ['allergy', 'appointment', 'consult', 'vital'], ['SITE;3'], function(error, result) {
                    done = true;
                    expect(error).toBeFalsy();
                    expect(result).toEqual({
                        'SITE;3': ['allergy', 'appointment', 'consult', 'vital']
                    });
                });
            });

            waitsFor(function() {
                return done;
            });
        });

        it('Error path: Error from JDS', function() {
            var jdsClient = new JdsClientDummy(log, {});
            var dummyVistaClient = {};
            var resyncUtil = new VistaResyncUtil(log, dummyVistaClient, jdsClient, updateConfig);
            var done = false;

            jdsClient._setResponseData([{
                error: 'ERROR!'
            }], [{
                statusCode: 500
            }], null);

            runs(function() {
                resyncUtil.retrievePatientSyncDomains('20071217151553', ['allergy', 'appointment', 'consult', 'vital'], ['SITE;3'], function(error, result) {
                    done = true;
                    expect(error).toBeTruthy();
                    expect(result).toBeFalsy();
                });
            });

            waitsFor(function() {
                return done;
            });
        });

        it('Error path: Unexpected response from JDS', function() {
            var jdsClient = new JdsClientDummy(log, {});
            var dummyVistaClient = {};
            var resyncUtil = new VistaResyncUtil(log, dummyVistaClient, jdsClient, updateConfig);
            var done = false;

            jdsClient._setResponseData([null], [{
                statusCode: 404
            }], null);

            runs(function() {
                resyncUtil.retrievePatientSyncDomains('20071217151553', ['allergy', 'appointment', 'consult', 'vital'], ['SITE;3'], function(error, result) {
                    done = true;
                    expect(error).toBeTruthy();
                    expect(result).toBeFalsy();
                });
            });

            waitsFor(function() {
                return done;
            });
        });
    });

    describe('getRecordsAndCreateJobs()', function() {
        var referenceInfo = {
            sessionId: 'TEST',
            utilityType: 'Vista Site Data Resync Util Unit Test'
        };

        it('Normal path: updateTime provided', function() {
            var vistaClient = {
                childInstance: function() {
                    return this;
                },
                getPatientDataByDomain: function(vistaId, dfn, domain, callback) {
                    if (domain === 'allergy') {
                        if (dfn === '3') {
                            callback(null, allergyDomainData1);
                        } else {
                            callback(null, allergyDomainData2);
                        }
                    } else if (domain === 'consult' && dfn === '8') {
                        callback(null, consultDomainData1);
                    }
                }
            };

            var pidsToResyncDomains = {
                'SITE;3': ['allergy'],
                'SITE;8': ['allergy', 'consult']
            };

            var dummyJdsClient = {};

            var resyncUtil = new VistaResyncUtil(log, vistaClient, dummyJdsClient, updateConfig);

            var jobsSentToBeanstalkByPid = [];
            spyOn(resyncUtil, 'writeJobsToBeanstalk').andCallFake(function(childLog, jobs, callback) {
                jobsSentToBeanstalkByPid.push(jobs);
                return callback(null, jobs.length);
            });

            resyncUtil.getRecordsAndCreateJobs(pidsToResyncDomains, 20071217151354, referenceInfo, function(error) {
                expect(error).toBeFalsy();
                var jobsSentToBeanstalk = _.flatten(jobsSentToBeanstalkByPid);
                expect(jobsSentToBeanstalk.length).toEqual(3);
                expect(jobsSentToBeanstalk).toContain(jasmine.objectContaining({
                    'type': 'record-update',
                    'timestamp': jasmine.any(String),
                    'patientIdentifier': {
                        'type': 'pid',
                        'value': 'SITE;3'
                    },
                    'dataDomain': 'allergy',
                    'record': {
                        'data': 'someData',
                        'pid': '2939;19',
                        'uid': 'urn:va:allergy:2939:19:106',
                        'stampTime': 20061217151354
                    },
                    'metaStamp': {
                        'stampTime': jasmine.any(String),
                        'sourceMetaStamp': {
                            2939: {
                                'pid': '2939;19',
                                'localId': '19',
                                'stampTime': jasmine.any(String),
                                'domainMetaStamp': {
                                    'allergy': {
                                        'domain': 'allergy',
                                        'stampTime': jasmine.any(String),
                                        'eventMetaStamp': {
                                            'urn:va:allergy:2939:19:106': {
                                                'stampTime': 20061217151354
                                            }
                                        }
                                    }
                                }
                            }
                        },
                        'icn': null
                    },
                    'jobId': jasmine.any(String),
                    referenceInfo: {
                        sessionId: referenceInfo.sessionId,
                        requestId: jasmine.any(String),
                        utilityType: referenceInfo.utilityType
                    }
                }));
                expect(jobsSentToBeanstalk).not.toContain(jasmine.objectContaining({
                    'type': 'record-update',
                    'timestamp': jasmine.any(String),
                    'patientIdentifier': {
                        'type': 'pid',
                        'value': 'SITE;3'
                    },
                    'dataDomain': 'allergy',
                    'record': {
                        'data': 'someData',
                        'pid': 'SITE;3',
                        'stampTime': 20160303154108,
                        'uid': 'urn:va:allergy:SITE:3:751'
                    },
                    'metaStamp': {
                        'stampTime': jasmine.any(String),
                        'sourceMetaStamp': {
                            'SITE': {
                                'pid': 'SITE;3',
                                'localId': '3',
                                'stampTime': jasmine.any(String),
                                'domainMetaStamp': {
                                    'allergy': {
                                        'domain': 'allergy',
                                        'stampTime': jasmine.any(String),
                                        'eventMetaStamp': {
                                            'urn:va:allergy:SITE:3:751': {
                                                'stampTime': 20160303154108
                                            }
                                        }
                                    }
                                }
                            }
                        },
                        'icn': null
                    },
                    'jobId': jasmine.any(String),
                    referenceInfo: {
                        sessionId: referenceInfo.sessionId,
                        requestId: jasmine.any(String),
                        utilityType: referenceInfo.utilityType
                    }
                }));
            });
        });

        it('Normal path: updateTime omitted', function() {
            var vistaClient = {
                childInstance: function() {
                    return this;
                },
                getPatientDataByDomain: function(vistaId, dfn, domain, callback) {
                    if (domain === 'allergy') {
                        if (dfn === '3') {
                            callback(null, allergyDomainData1);
                        } else {
                            callback(null, allergyDomainData2);
                        }
                    } else if (domain === 'consult' && dfn === '8') {
                        callback(null, consultDomainData1);
                    }
                }
            };

            var pidsToResyncDomains = {
                'SITE;3': ['allergy'],
                'SITE;8': ['allergy', 'consult']
            };

            var dummyJdsClient = {};

            var resyncUtil = new VistaResyncUtil(log, vistaClient, dummyJdsClient, updateConfig);

            var jobsSentToBeanstalkByPid = [];
            spyOn(resyncUtil, 'writeJobsToBeanstalk').andCallFake(function(childLog, jobs, callback) {
                jobsSentToBeanstalkByPid.push(jobs);
                return callback(null, jobs.length);
            });

            resyncUtil.getRecordsAndCreateJobs(pidsToResyncDomains, null, referenceInfo, function(error) {
                expect(error).toBeFalsy();
                var jobsSentToBeanstalk = _.flatten(jobsSentToBeanstalkByPid);
                expect(jobsSentToBeanstalk.length).toEqual(4);
                expect(jobsSentToBeanstalk).toContain(jasmine.objectContaining({
                    'type': 'record-update',
                    'timestamp': jasmine.any(String),
                    'patientIdentifier': {
                        'type': 'pid',
                        'value': 'SITE;3'
                    },
                    'dataDomain': 'allergy',
                    'record': {
                        'data': 'someData',
                        'pid': '2939;19',
                        'uid': 'urn:va:allergy:2939:19:106',
                        'stampTime': 20061217151354
                    },
                    'jobId': jasmine.any(String),
                    'metaStamp': {
                        stampTime: jasmine.any(String),
                        sourceMetaStamp: {
                            2939: {
                                pid: '2939;19',
                                localId: '19',
                                stampTime: jasmine.any(String),
                                domainMetaStamp: {
                                    allergy: {
                                        domain: 'allergy',
                                        stampTime: jasmine.any(String),
                                        eventMetaStamp: {
                                            'urn:va:allergy:2939:19:106': {
                                                stampTime: 20061217151354
                                            }
                                        }
                                    }
                                }
                            }
                        },
                        icn: null
                    },
                    referenceInfo: {
                        sessionId: referenceInfo.sessionId,
                        requestId: jasmine.any(String),
                        utilityType: referenceInfo.utilityType
                    }
                }));
                expect(jobsSentToBeanstalk).toContain(jasmine.objectContaining({
                    'type': 'record-update',
                    'timestamp': jasmine.any(String),
                    'patientIdentifier': {
                        'type': 'pid',
                        'value': 'SITE;3'
                    },
                    'dataDomain': 'allergy',
                    'record': {
                        'data': 'someData',
                        'pid': 'SITE;3',
                        'stampTime': 20160303154108,
                        'uid': 'urn:va:allergy:SITE:3:751'
                    },
                    'metaStamp': {
                        'stampTime': jasmine.any(String),
                        'sourceMetaStamp': {
                            'SITE': {
                                'pid': 'SITE;3',
                                'localId': '3',
                                'stampTime': jasmine.any(String),
                                'domainMetaStamp': {
                                    'allergy': {
                                        'domain': 'allergy',
                                        'stampTime': jasmine.any(String),
                                        'eventMetaStamp': {
                                            'urn:va:allergy:SITE:3:751': {
                                                'stampTime': 20160303154108
                                            }
                                        }
                                    }
                                }
                            }
                        },
                        'icn': null
                    },
                    referenceInfo: {
                        sessionId: referenceInfo.sessionId,
                        requestId: jasmine.any(String),
                        utilityType: referenceInfo.utilityType
                    },
                    'jobId': jasmine.any(String)
                }));
            });
        });

        it('Error path: Error returned by beanstalk', function() {
            var vistaClient = {
                childInstance: function() {
                    return this;
                },
                getPatientDataByDomain: function(vistaId, dfn, domain, callback) {
                    if (domain === 'allergy') {
                        if (dfn === '3') {
                            callback(null, allergyDomainData1);
                        } else {
                            callback(null, allergyDomainData2);
                        }
                    } else if (domain === 'consult' && dfn === '8') {
                        callback(null, consultDomainData1);
                    }
                }
            };

            var pidsToResyncDomains = {
                'SITE;3': ['allergy'],
                'SITE;8': ['allergy', 'consult']
            };

            var dummyJdsClient = {};

            var resyncUtil = new VistaResyncUtil(log, vistaClient, dummyJdsClient, updateConfig);

            var jobsSentToBeanstalkByPid = [];
            spyOn(resyncUtil, 'writeJobsToBeanstalk').andCallFake(function(childLog, jobs, callback) {
                jobsSentToBeanstalkByPid.push(_.first(jobs));
                return callback('Beanstalk error!', 3);
            });

            resyncUtil.getRecordsAndCreateJobs(pidsToResyncDomains, null, referenceInfo, function(error) {
                expect(error).toBeFalsy();
                var jobsSentToBeanstalk = _.flatten(jobsSentToBeanstalkByPid);
                expect(jobsSentToBeanstalk.length).toEqual(3);
            });
        });

        it('Error path: error from VistA', function() {
            var vistaClient = {
                childInstance: function() {
                    return this;
                },
                getPatientDataByDomain: function(vistaId, dfn, domain, callback) {
                    callback('ERROR!');
                }
            };

            var pidsToResyncDomains = {
                'SITE;3': ['allergy'],
                'SITE;8': ['allergy', 'consult']
            };

            var dummyJdsClient = {};

            var resyncUtil = new VistaResyncUtil(log, vistaClient, dummyJdsClient, updateConfig);

            spyOn(resyncUtil, 'writeJobsToBeanstalk').andCallFake(function(childLog, jobs, callback) {
                return callback(null, jobs.length);
            });

            resyncUtil.getRecordsAndCreateJobs(pidsToResyncDomains, 20071217151354, referenceInfo, function(error, result) {
                expect(error).toBeFalsy();
                expect(result).toBeFalsy();
            });
        });
    });
});