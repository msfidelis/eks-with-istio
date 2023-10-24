apiVersion: karpenter.k8s.aws/v1alpha1
kind: AWSNodeTemplate
metadata:
  name: ${EKS_CLUSTER}
spec:
  subnetSelector:
    aws-ids: ${EKS_SUBNETS}
  launchTemplate: ${LAUNCH_TEMPLATE}