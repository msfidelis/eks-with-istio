#!/bin/bash
set -ex

/etc/eks/bootstrap.sh ${CLUSTER_ID} --b64-cluster-ca ${B64_CLUSTER_CA} --apiserver-endpoint ${APISERVER_ENDPOINT}