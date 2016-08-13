// Copyright (c) 2016, Robert Adams
// Licensed under BSD 3-Clause license. See accompanying LICENSE file.

module.exports = function(params, keyStore) {
    var module = {};

    module.params = params;
    module.keyStore = keyStore;

    module.pestoServer = require('../gen-Pesto-server-node/Pesto');
    module.pestoServerTypes = require('../gen-Pesto-server-node/Pesto-server_types');

    module.thrift = require('thrift');

    module.Init = function() {
        this.server = this.thrift.createServer(this.pestoServer, {
            SetConfiguration: function(result) {
                console.log('pestoServer SetConfiguration');
            },
            GetConfiguration: function(result) {
                console.log('pestoServer GetConfiguration');
            },
            Subscribe: function() {
                console.log('pestoServer Subscribe');
            },
            UnSubscribe: function() {
                console.log('pestoServer UnSubscribe');
            },
            GetSubscriptions: function(result) {
                console.log('pestoServer GetSubscriptions');
            },
            Notify: function() {
                console.log('pestoServer Notify');
            }
        });
    };

    module.Start = function() {
        this.server.listen(params.pestoPort);
    };

    return module;
};
