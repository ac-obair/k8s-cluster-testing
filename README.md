edits to remaining files have been commented in each file

removed files
public ip
filebeat
view-role
kured
kube state metrics

dirty key pair for testing
```bash
./gen.sh
```
new cluster
```bash
terraform plan && terraform apply
```
get nodePort url
```
./get_url.sh
```
cert-manager crds
```
kubectl get/describe certificate --all-namespaces
kubectl get/describe certificaterequest --all-namespaces
kubectl get/describe clusterissuer/issuer --all-namespaces
kubectl get/describe order <order> --all-namespaces
```
