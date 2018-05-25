# chart-monitoring

This chart is a set of monitoring resources that use CRDs created by prometheus operator.

Goal of this chart is to deploy prometheus operator, and after successfull creation of CRDs, then deploy the custom resources with the help of helm hooks. 

It is a merger of the following charts:
* https://github.com/stakater/chart-prometheus-operator
* https://github.com/stakater/chart-prometheus
* https://github.com/stakater/chart-alertmanager
* https://github.com/stakater/chart-k8s-servicemonitors

## Installing

Install `monitoring` chart

```bash
helm install --name monitoring chartmuseum/monitoring
```

With this chart, you would also need to apply the following charts for monitoring solution to work:

* https://github.com/stakater/chart-prometheus-k8s-services
* https://github.com/stakater/chart-kube-state-metrics
* https://github.com/stakater/chart-node-exporter

## Note:
Deleting the chart won't delete unsuccessfull jobs, CRDs, and custom resources created from CRDs.

## Reference links:
* https://github.com/kubernetes/helm/blob/master/docs/charts_hooks.md
* https://github.com/coreos/prometheus-operator/tree/master/helm/prometheus-operator/templates
* https://github.com/camilb/prometheus-kubernetes