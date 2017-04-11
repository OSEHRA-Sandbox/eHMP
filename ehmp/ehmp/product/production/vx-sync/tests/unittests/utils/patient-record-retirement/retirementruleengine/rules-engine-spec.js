'use strict';
require('../../../../../env-setup');
var RetirementRulesEngine = require(global.VX_RETIREMENTRULES + '/rules-engine');

var _ = require('underscore');
var log = {
    debug: function() {},
    warn: function() {},
    trace: function() {},
    info: function() {}
};
var config = {
    'recordRetirement': {
        'rules': {
            'largePatientRecord': {
                'largePatientLastAccessed': 10,
                'patientDocumentSizeLimit': 0,
                'avgSizePerEvent': 100
            }
        }
    },
    'syncRequestApi': {
        'protocol': 'http',
        'host': '10.3.3.6',
        'port': '8080',
        'timeout': 300000
    },
    'vistaSites': {
        'C877': {
            'name': 'KODAK'
        },
        '9E7A': {
            'name': 'PANORAMA'
        }
    }
};
var environment = {
    metrics: log
};
var inpatient = require(global.VX_RETIREMENTRULES + '/inpatient-rule');

describe('rules-engine.js', function() {
    var engine = new RetirementRulesEngine(log, config, environment);
    var patientIds = [{
        value: '9E7A;3',
        type: 'PID'
    }, {
        value: '302394234V323425',
        type: 'ICN'
    }, {
        value: 'DOD;0000000003',
        type: 'PID'
    }];
    it('inpatient', function() {
        engine.rules = [inpatient];
        engine.processRetirementRules(patientIds, function(err, result) {
            expect(result).toBe(patientIds);
        });
    });
});