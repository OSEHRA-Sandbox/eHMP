'use strict';

var PublisherDummy = require('./publisherDummy.js');

function Router(log, config, jobStatusUpdater, PublisherClass) {
    this.log = log;
    this.config = config;
}

Router.prototype.publish = function(jobs, options, callback) {
    // second parameter is optional
    if (arguments.length === 2) {
        callback = arguments[1];
    }

    return setTimeout(callback, 0, null, jobs);
};

Router.prototype.getPublisherForJob = function(job) {
    return new PublisherDummy(this.log, this.config, 'dummyJob');
};

Router.prototype.childInstance = function(log){
	return this;
};

module.exports = Router;
