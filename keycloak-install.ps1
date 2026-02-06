helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

helm upgrade --install keycloak bitnami/keycloak `
  --set auth.adminUser=admin `
  --set auth.adminPassword=yourpassword `
  --namespace keycloak `
  --create-namespace `
  -f keycloak-values.yaml