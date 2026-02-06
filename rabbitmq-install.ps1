helm repo add bitnamilegacy https://charts.bitnami.com/bitnami
helm repo update

Write-Host "Installing/Upgrading RabbitMQ..."
helm upgrade --install rabbitmq bitnamilegacy/rabbitmq `
  --create-namespace `
  --namespace rabbitmq `
  -f rabbitmq-values.yaml

Write-Host "Installation complete."
