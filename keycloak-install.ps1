helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm upgrade --install keycloak bitnami/keycloak `
  --version 25.2.0 `
  --create-namespace `
  --namespace keycloak `
  -f keycloak-values.yaml
