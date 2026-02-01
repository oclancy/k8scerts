
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx 
helm upgrade --install my-nginx-ingress ingress-nginx/ingress-nginx `
--create-namespace `
-n nginx `
-f nginx-values.yaml