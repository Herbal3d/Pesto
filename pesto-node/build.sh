#! /bin/bash
# Assemble the pieces for Pesto NodeJS source build

# The Pesto git repository is cloned into a directory that also
#   includes the clones of Basil-protocol and the Thift sources.
#   Those other projects must be build and around to be copied into
#   the Pesto source tree.

# This presumes BASEDIR contains a built version of Thrift ('thrift-git')
#    and a compiled version of the Pesto thrift code ('Basil-protocol-git').

BASEDIR=/home/basil
PESTODIR=${BASEDIR}/pesto-git/pesto-node

PROTOCOLDIR=${BASEDIR}/Basil-protocol-git
PROTOCOLPESTOSERVER=gen-Pesto-server-node
PROTOCOLPESTOSERVERDIR=${PROTOCOLDIR}/${PROTOCOLPESTOSERVER}
# For the test program
PROTOCOLPESTOCLIENT=gen-Pesto-client-py
PROTOCOLPESTOCLIENTDIR=${PROTOCOLDIR}/${PROTOCOLPESTOCLIENT}

THRIFTDIR=${BASEDIR}/thrift-git

THRIFTPYDIR=lib/python2.7/site-packages/thrift

cd "${PESTODIR}"

if [[ -L "node_modules/thrift" ]] ; then
    rm -f "node_modules/thrift"
fi
if [[ -d "node_modules/thrift" ]] ; then
    rm -rf "node_modules/thrift"
fi
ln -s "${THRIFTDIR}" node_modules/thrift

cd "${PESTODIR}"
rm -rf "${PROTOCOLPESTOSERVER}"
# thought I could use a symbolic link but, because of how NodeJS resolves
#    requires (it dereferences all symbolic links) it was getting confused.
# ln -s "${PROTOCOLPESTOSERVERDIR}" ${PROTOCOLPESTOSERVER}
cp -r "${PROTOCOLPESTOSERVERDIR}" ${PROTOCOLPESTOSERVER}

rm -rf ${PROTOCOLPESTOCLIENT}
cp -r ${PROTOCOLPESTOCLIENTDIR} ${PROTOCOLPESTOCLIENT}

rm -f test/venv/${THRIFTPYDIR}
ln -s /usr/${THRIFTPYDIR} test/venv/${THRIFTPYDIR}
