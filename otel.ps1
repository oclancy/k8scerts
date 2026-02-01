helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts `
    helm install my-opentelemetry-operator open-telemetry/opentelemetry-operator `
    --set "manager.collectorImage.repository=otel/opentelemetry-collector-k8s" `
    --set admissionWebhooks.certManager.enabled=false `
    --set admissionWebhooks.autoGenerateCert.enabled=true
