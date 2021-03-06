'use strict';

var getTime = require('./lab-current-time').getCurrentTime;

var log = sinon.stub(require('bunyan').createLogger({
    name: 'lab-current-time'
}));

var configuration = {
    environment: 'development',
    context: 'OR CPRS GUI CHART',
    host: 'IP        ',
    port: PORT,
    accessCode: 'USER  ',
    verifyCode: 'PW      ',
    localIP: 'IP      ',
    localAddress: 'localhost'
};

describe('lab-current-time resource integration test', function() {
    it('can call the RPC', function(done) {
        this.timeout(20000);
        getTime(log, configuration, function(err, result) {
            expect(err).to.be.falsy();
            expect(result).to.be.truthy();
            done();
        });
    });
});
