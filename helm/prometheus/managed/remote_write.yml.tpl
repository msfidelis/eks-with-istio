prometheus:
  prometheusSpec:
    # podMonitorNamespaceSelector:
    #   any: true
    podMonitorSelector: {}
    podMonitorSelectorNilUsesHelmValues: false
    # ruleNamespaceSelector:
    #   any: true
    ruleSelector: {}
    ruleSelectorNilUsesHelmValues: false
    # serviceMonitorNamespaceSelector:
    #   any: true
    serviceMonitorSelector: {}
    serviceMonitorSelectorNilUsesHelmValues: false

prometheusOperator:
  enabled: true
  namespaces: ''
  denyNamespaces: ''
  prometheusInstanceNamespaces: ''
  alertmanagerInstanceNamespaces: ''
  thanosRulerInstanceNamespaces: ''
