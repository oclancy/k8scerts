# Add the Grafana Helm repository
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Install Grafana Tempo
Write-Host "Installing/Upgrading Grafana Tempo..."
helm upgrade --install tempo grafana/tempo -f grafana/tempo-values.yaml

# Install Grafana Alloy
Write-Host "Installing/Upgrading Grafana Alloy..."
helm upgrade --install alloy grafana/alloy -f grafana/grafana-values.yaml

# Install Prometheus
Write-Host "Installing/Upgrading Prometheus..."
helm upgrade --install prometheus prometheus-community/prometheus --set prometheus-node-exporter.enabled=false

# Install Loki
Write-Host "Installing/Upgrading Loki..."
helm upgrade --install loki grafana/loki-stack --set promtail.enabled=false --set grafana.enabled=false

# Install Grafana Dashboard
# Install Grafana Dashboard
Write-Host "Installing/Upgrading Grafana Dashboard..."
# Create/Update Dashboards ConfigMap
kubectl create configmap grafana-dashboards --from-file=grafana/dashboards --dry-run=client -o yaml | kubectl label -f - --local --dry-run=client -o yaml grafana_dashboard=1 | kubectl apply -f -

helm upgrade --install grafana grafana/grafana -f grafana/grafana-dashboard-values.yaml

Write-Host "Installation complete."
