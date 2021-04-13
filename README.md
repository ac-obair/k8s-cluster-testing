#### Note 
This repo may container credentials these are for testing only and have no impact on production. 

Since org repos can't be forked this code is based off of the `aks-cluster-config/` dir of [ac-iac-platform]() repo. Edits to remaining files have been commented and private subscription added.
### k8s
The following `ac-iac-platform` files have been removed completely as they're not necessary for testing.
```
public-ip.tf
filebeat.tf
view-role.tf
kured.tf
kube-state-metrics.tf
```

The `awx-on-docker` directory is for setting up docker outside of k8s this mimics a server installation and could potentially work with azure container instances or docker directly. You can use this to edit and build source code if testing or exploring changes. 
### cluster

For mimicking an aks setup we first need a keypair. These steps setup a base cluster to which awx can be deployed. 

Generate a dirty key pair for testing
```bash
scripts/generate-key-pair.sh
```
Set up a fresh new test cluster
```bash
terraform plan && terraform apply
```
Get nodePort url for k8s ingress
```
scripts/get-k8s-ingress-url.sh
```
cert-manager crds useful commands
```
kubectl get/describe certificate --all-namespaces
kubectl get/describe certificaterequest --all-namespaces
kubectl get/describe clusterissuer/issuer --all-namespaces
kubectl get/describe order <order> --all-namespaces
```