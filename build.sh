#! /bin/bash
# Assemble the pieces for Pesto source build

# The Pesto git repository is cloned into a directory that also
#   includes the clones of Basil-protocol and the Thift sources.
#   Those other projects must be build and around to be copied into
#   the Pesto source tree.

BASEDIR=/home/basil
PESTODIR=${BASEDIR}/pesto-git

PROTOCOLDIR=${BASEDIR}/Basil-protocol-git
PROTOCOLPESTOSERVER=gen-Pesto-server-node
PROTOCOLPESTOSERVERDIR=${PROTOCOLDIR}/${PROTOCOLPESTOSERVER}
THRIFTDIR=${BASEDIR}/thrift-git

cd "${PESTODIR}"

if [[ -L "node_modules/thrift" ]] ; then
    rm -f "node_modules/thrift"
fi
if [[ -d "node_modules/thrift" ]] ; then
    rm -rf "node_modules/thrift"
fi
ln -s "${THRIFTDIR}" node_modules/thrift

cd "${PESTODIR}"
rm -f "${PROTOCOLPESTOSERVER}"
# thought I could use a symbolic link but, because of how NodeJS resolves
#    requires (it dereferences all symbolic links) it was getting confused.
# ln -s "${PROTOCOLPESTOSERVERDIR}" ${PROTOCOLPESTOSERVER}
cp -r "${PROTOCOLPESTOSERVERDIR}" ${PROTOCOLPESTOSERVER}


