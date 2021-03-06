'use strict';

require('../../env-setup');
var inspect = require('util').inspect;
var rpcUtil = require(global.VX_UTILS + '/rpc-util');

var argv = require('yargs')
	.usage('Usage: $0 [options...]')
	.demand(['host', 'port'])
	.describe('host', 'IP Address of the VistA host')
	.describe('port', 'Port of the VistA host')
	.describe('accessCode', 'Value to use for accessCode for validation. Defaults to USER  ')
	.describe('verifyCode', 'Value to use for verifyCode for validation. Defaults to PW      ')
	.nargs('accessCode', 1)
	.nargs('verifyCode', 1)
	.describe('localIP', 'Value to use for the localIP parameter in the RPC call. Defaults to 127.0.0.1')
	.describe('localAddress', 'Value to use for the localAddress parameter in the RPC call. Defaults to localhost')
	.describe('connectTimeout', 'Value in milliseconds to use for the connectTimeout parameter in the RPC call. Defaults to 3000')
	.describe('sendTimeout', 'Value in milliseconds to use for the sendTimeout parameter in the RPC call. Defaults to 10000')
	.describe('context', 'Context to set for running the RPC. Defaults to HMP SYNCHRONIZATION CONTEXT')
	.describe('hmpServerId', 'Value for the hmpServerId parameter. Defaults to hmp-development-box')
	.describe('vpr', 'Use the VPR namespace. Defaults to the HMP namespace.')
	.describe('logLevel', 'bunyan log levels, one of: trace, debug, info, warn, error, fatal. Defaults to error.')
	.argv;


var logger = require('bunyan').createLogger({
	name: 'rpc',
	level: argv.logLevel || 'error'
});

var prefix = argv.vpr ? 'VPR' : 'HMP';


var rpc = 'VPRDJFS API'.replace('VPR', prefix);
var params = {
	'"server"': argv.hmpServerId || 'hmp-development-box',
	'"command"': 'startOperationalDataExtract'
};


var config = {
	host: argv.host,
	port: argv.port,
	accessCode: argv.accessCode || 'USER  ',
	verifyCode: argv.verifyCode || 'PW      ',
	localIP: argv.localIP || '127.0.0.1',
	localAddress: argv.localAddress || 'localhost',
	context: argv.context || 'VPR SYNCHRONIZATION CONTEXT'.replace('VPR', prefix),
	connectTimeout: argv.connectTimeout || 3000,
	sendTimeout: argv.sendTimeout || 10000
};

rpcUtil.standardRPCCall(logger, config, rpc, params, null, function(error, response) {
	logger.debug('Completed calling Subscribe RPC for dfn: %s; result: %j', argv.dfn, response);
	if (error) {
		console.log('Error calling Subscribe for dfn: %s', argv.dfn);
		console.log(error);
		if (response) {
			console.log(response);
		}
		process.exit(1);
	}

	console.log('Called Subscribe for dfn: %s', argv.dfn);
	console.log('Response:');
	try {
		console.log(inspect(JSON.parse(response), {
			depth: null
		}));
	} catch (err) {
		console.log(response);
	}
	process.exit(0);
});