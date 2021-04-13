ensure keyvault is created first 
```bash
cd azure-keyvault
terraform plan && terraform apply
```
ensure keyvault is populated with the requisit credentials from the project root
```bash
awx/scripts/awx-azure-keyvault-secrets.sh
```