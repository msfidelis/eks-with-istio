!/bin/bash
set -ex

exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

yum install -y amazon-ssm-agent
systemctl enable amazon-ssm-agent && systemctl start amazon-ssm-agent

/etc/eks/bootstrap.sh ${CLUSTER_ID} --b64-cluster-ca ${B64_CLUSTER_CA} --apiserver-endpoint ${APISERVER_ENDPOINT}