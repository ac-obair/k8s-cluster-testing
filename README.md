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
setup `pip install [awxkit](https://docs.ansible.com/ansible-tower/latest/html/towercli/index.html)`
```bash
. ./awxkit_env.sh
```
run `awx config`
```json
{
     "base_url": "https://awx.example.com:32208",
     "token": "",
     "use_sessions": false,
     "credentials": {
          "default": {
               "username": "admin",
               "password": "password"
          }
     }
}
```
awx set up `awx ping -k`
```json

{
     "ha": false,
     "version": "18.0.0",
     "active_node": "awx-5fbbbf7b79-7z2fk",
     "install_uuid": "cd81e5a3-77c9-40b8-9cab-e0d17049d2ba",
     "instances": [
          {
               "node": "awx-5fbbbf7b79-7z2fk",
               "uuid": "00000000-0000-0000-0000-000000000000",
               "heartbeat": "2021-04-07T11:34:26.703777Z",
               "capacity": 0,
               "version": "18.0.0"
          }
     ],
     "instance_groups": [
          {
               "name": "tower",
               "capacity": 0,
               "instances": []
          }
     ]
}
```
