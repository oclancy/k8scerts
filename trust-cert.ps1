$secretName = "grafana-tls-secret"
$certFile = "grafana.crt"

# Get the certificate from the secret
$certData = kubectl get secret $secretName -o jsonpath='{.data.tls\.crt}'

if (-not $certData) {
    Write-Error "Secret $secretName not found or does not contain tls.crt"
    exit 1
}

# Decode base64
$certContent = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($certData))

# Save to file
$certContent | Out-File -Encoding ASCII $certFile
Write-Host "Certificate saved to $certFile"

# Install certificate to CurrentUser Root store
Write-Host "Installing certificate to Trusted Root Certification Authorities..."
Import-Certificate -FilePath $certFile -CertStoreLocation Cert:\CurrentUser\Root

Write-Host "Certificate installed successfully. You may need to restart your browser."
