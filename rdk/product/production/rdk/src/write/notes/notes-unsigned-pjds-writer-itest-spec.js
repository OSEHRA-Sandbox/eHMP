'use strict';

var pJdsWriter = require('./notes-unsigned-pjds-writer');

var writebackContext = {
    duz: {
        '9E7A': '10000000255'
    },
    siteHash: '9E7A',
    pid: '9E7A;8',
    vistaConfig: {
        host: '10.2.2.101',
        port: 9210,
        accessCode: 'pu1234',
        verifyCode: 'pu1234!!',
        localIP: '10.2.2.1',
        localAddress: 'localhost',
        context: 'HMP UI CONTEXT'
    },
    model: {
        'authorUid': '10000000255',
        'documentDefUid': 'urn:va:doc-def:9E7A:40',
        'encounterUid': 'H2931013',
        'encounterDateTime': '199310131400',
        'referenceDateTime': '201507101410',
        'locationUid': 'urn:va:location:9E7A:32',
        'patientIcn': '10110V004877',
        'pid': '9E7A;8',
        'status': 'UNSIGNED'
    },
    appConfig: {
        'jdsServer': {
            'host': '10.2.2.110',
            'port': 9080,
            'baseUrl': 'http://10.2.2.110:9080'
        }
    }
};

describe('write-back notes pjds writer', function() {
    describe('tests create', function() {
        it.skip('returns success with vprResponse set', function() {
            expect(writebackContext.vprResponse).to.be.undefined();
            pJdsWriter.create(writebackContext, function(err) {
                expect(err).to.be.falsy();
                expect(writebackContext.vprResponse).to.be.defined();
            });
        });
    });
    describe('tests update', function() {
        it.skip('returns success with vprResponse set', function() {
            writebackContext.model.text = 'TEST TEXT';
            pJdsWriter.update(writebackContext, function(err) {
                expect(err).to.be.falsy();
                expect(writebackContext.vprResponse).to.equal({
                    success: 'Successfully updated note.'
                });
            });
        });
    });
    describe('tests read', function() {
        it.skip('returns success with vprResponse set', function() {
            pJdsWriter.read(writebackContext, function(err) {
                expect(err).to.be.falsy();
                expect(writebackContext.vprResponse.docs[0].text).to.equal('TEST TEXT');
            });
        });
    });
    describe('tests delete', function() {
        it.skip('returns success with vprResponse set', function() {
            pJdsWriter.delete(writebackContext, function(err) {
                expect(err).to.be.falsy();
                expect(writebackContext.vprResponse).to.equal({
                    'delete': true
                });
            });
        });
    });
});
