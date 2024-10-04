apiVersion: karpenter.k8s.aws/v1
kind: EC2NodeClass
metadata:
  name: ${EKS_CLUSTER}-nodeclass
spec:

  instanceProfile: ${INSTANCE_PROFILE}
  amiSelectorTerms:
  
  - id: ${AMI_ID}

  amiFamily: ${AMI_FAMILY}

  securityGroupSelectorTerms:
  %{ for sg in SECURITY_GROUPS ~}

  - id: ${sg}

  %{ endfor ~}  

  subnetSelectorTerms:
  %{ for sb in EKS_SUBNETS ~}

  - id: ${sb}

  %{ endfor ~}  

  launchTemplate:
    id: ${LAUNCH_TEMPLATE}