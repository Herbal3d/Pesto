// Copyright (c) 2016, Robert Adams
// Licensed under BSD 3-Clause license. See accompanying LICENSE file.

module.exports = function(params, keyStore) {
    var module = {};

    module.params = params;
    module.keyStore = keyStore;

    module.pestoServer = require('../gen-Pesto-server-node/Pesto');
    module.pestoServerTypes = require('../gen-Pesto-server-node/PestoServer_types');

    module.thrift = require('thrift');

    // Perform initialization of Thrift functions
    module.Init = function() {
        this.server = this.thrift.createServer(this.pestoServer, {
            SetConfiguration: function(auth, configs, notifyThis) {
                console.log('pestoServer SetConfiguration');
            },
            GetConfiguration: function(auth, filter, result) {
                console.log('pestoServer GetConfiguration');
                res = new this.pestoServerTypes
                result( {} );
            },
            Subscribe: function(auth, topic, subscriptionID, topicParameters) {
                console.log('pestoServer Subscribe');
            },
            UnSubscribe: function(auth, topic, subscriptionID) {
                console.log('pestoServer UnSubscribe');
            },
            GetSubscriptions: function(auth, filter, result) {
                console.log('pestoServer GetSubscriptions');
                result( {} );
            },
            Notify: function(auth, topic, props) {
                console.log('pestoServer Notify');
            }
        });
    };

    // Start listening and processing.
    module.Start = function() {
        this.server.listen(params.pestoPort);
    };

    return module;
};
