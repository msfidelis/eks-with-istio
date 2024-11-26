apiVersion: karpenter.sh/v1
kind: NodePool
metadata:
  name: ${EKS_CLUSTER}-nodepool
spec:
  disruption:
    consolidationPolicy: WhenEmptyOrUnderutilized
    consolidateAfter: 2m
  topologySpreadConstraints:
    - maxSkew: 1
      topologyKey: "topology.kubernetes.io/zone"
      whenUnsatisfiable: ScheduleAnyway
  template:
    spec:
      requirements:
        - key: karpenter.k8s.aws/instance-family
          operator: In
          values: 
  %{ for ifm in INSTANCE_FAMILY ~}
  
          - ${ifm}

  %{ endfor ~}

        - key: karpenter.sh/capacity-type
          operator: In
          values:
  %{ for cpct in CAPACITY_TYPE ~}

          - ${cpct}

  %{ endfor ~}

        - key: karpenter.k8s.aws/instance-size
          operator: In
          values:
  %{ for ifs in INSTANCE_SIZES ~}

          - ${ifs}

  %{ endfor ~}       

        - key: "topology.kubernetes.io/zone" 
          operator: In
          values:
  %{ for az in AVAILABILITY_ZONES ~}

          - ${az}
          
  %{ endfor ~}
  
      nodeClassRef:
        group: karpenter.k8s.aws
        kind: EC2NodeClass
        name: ${EKS_CLUSTER}-nodeclass
