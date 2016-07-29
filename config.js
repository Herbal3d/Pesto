// Global configuration

// This file should be 'config.json' but, because of some idealogical
//     beliefs, you can't have comments in JSON files.

var Globals = {
    // IPv4 port the http interface for Pesto listens on
    'listenPort': '31997',

    // IPv4 port the Pesto Thrift service listens on
    'pestoPort': '31998',
};

module.exports = Globals;
