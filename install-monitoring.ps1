# Add the Grafana Helm repository
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

# Install Grafana Tempo
Write-Host "Installing/Upgrading Grafana Tempo..."
helm upgrade --install tempo grafana/tempo -f tempo-values.yaml

# Install Grafana Alloy
Write-Host "Installing/Upgrading Grafana Alloy..."
helm upgrade --install alloy grafana/alloy -f grafana-values.yaml

# Install Grafana Dashboard
Write-Host "Installing/Upgrading Grafana Dashboard..."
helm upgrade --install grafana grafana/grafana -f grafana-dashboard-values.yaml

Write-Host "Installation complete."
