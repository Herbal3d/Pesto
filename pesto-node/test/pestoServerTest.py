#! python

# Copyright (c) 2016, Robert Adams
# Licensed under BSD 3-clause license. See accompanying LICENSE file.

import sys
import time
import logging
import argparse

# The precompiled Thrift classes are in this directory
sys.path.append('../gen-Pesto-client-py')

from BasilType import *
from PestoClient import *

from thrift import Thrift
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

def InitLogging():
    logger = logging.getLogger(__name__)
    formatter = logging.Formatter('%(asctime)s:%(name)s[%(levelname)s]:%(message)s', '%Y%m%d.%H%M%S')
    fileLogHandler = logging.FileHandler('test.log')
    fileLogHandler.setFormatter(formatter)
    logger.addHandler(fileLogHandler)

    consoleLogHandler = logging.StreamHandler(sys.stdout)
    consoleLogHandler.setFormatter(formatter)
    logger.addHandler(consoleLogHandler)
    
    return logger

def CommandLineParser():
    parser = argparse.ArgumentParser(description="Tester of Pesto server protocol implementation")
    parser.add_argument("-H", "--host", dest="host", help="Host of server to test", required=True, type=str)
    parser.add_argument("-P", "--port", dest="port", help="Port of server to test", required=True, type=int)
    parser.add_argument("-v", "--verbose", dest="verbose", help="output extra stuff", action="store_true")
    try:
        argg = parser.parse_args()
    except:
        parser.error("exiting")

    return argg

def main(argv):
    log = InitLogging()
    log.setLevel('DEBUG')
    log.info('starting')

    args = CommandLineParser()

    transport = TSocket.TSocket(args.host, args.port)

    transport = TTransport.TBufferedTransport(transport)

    protocol = TBinaryProtocol.TBinaryProtocol(transport)

    log.debug('about to call Calculator')
    client = Calculator.Client(protocol)

    # Connect!
    log.debug('connecting')
    transport.open()

    transport.close()

    log.debug('shutdown')
    log.shutdown()

if __name__ == "__main__":
    main(sys.argv)

