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
### awx
Note that the ingress url for awx can be set as part of `awx.yaml`  and needs to be added to the /etc/hosts file when testing. `127.0.0.1       kubernetes.docker.internal awx.example.com`

Deploy the awx-operator reconsiliation loop. This is deployed to the default namespace by default.

![installation](https://user-images.githubusercontent.com/20089429/114378094-44104180-9b7f-11eb-80d4-9c322a8b6116.gif)


This will give you a fully working awx installation.

<img width="676" alt="Screenshot 2021-04-12 at 10 58 52" src="https://user-images.githubusercontent.com/20089429/114377085-2db5b600-9b7e-11eb-8f57-61766e01b45c.png">


Get the frontend nodePort url for connectioning to awx:
```
# spits out username and password
awx/scripts/get-awx-login-url.sh
```
### external postgres

This can be done either to a docker instance external to k8s for testing or direct to azure. The appropriate connection string details have to be set in `awx/awx.yaml` assuming the db exists else the `awx-postgres-0 ` pod is used.

```yaml
#connect to azure test db server instance
host: awx-external-postgres.postgres.database.azure.com
port: "5432"
database: awx
username: psqladminun@awx-external-postgres
password: "LetjIma1o3uQYbs2cq1GJYkI!"

# connect to local docker instance (external to k8s)
host: kubernetes.docker.internal
port: "5432"
database: awx
username: awx
password: "1234"
```
#### docker
Note this db can be stopped and started using `docker container stop/start <container-uid>` for testing. 
```bash
scripts/setup-external-postgres.sh
```
Connect reconcilistion loop to external db test.  Due to how /etc/hosts name are resolved the db connection string is the first name `kubernetes.docker.internal`
```bash
kubectl apply -f awx-postgres-configuration.yaml
```
Once patched the db migation will start, when complete this script will test the db has been populated.
```
scripts/test-migrated-awx-db.sh
```

If you remove the db entirly as if you were rebuilding it back from scratch then updating the awx.yaml or deleteing a pod causes the reconsilitation loop to rebuild the entire db back for you. This can take a few minutes. The awx endpoint will show as this in the browser:

<img src="https://user-images.githubusercontent.com/20089429/114372717-c39b1200-9b79-11eb-9565-f5b2d4babfcf.gif" width="600" height="400">

#### azure

Create a db, note that connection testing can be done by disabling the firewall rule temporarily.
```bash
cd awx && terraform apply
```
Test that to db is populated and working
```bash
scripts/test-external-postgre-azure.sh
```
View logging
```bash
# view migration logging
kubectl logs awx-operator-57bcb58f5-2v7kj -f
# view web frontend logging
kubectl logs awx-68db7445d-xcpmr -c awx-web -f
```
### awxkit
Setup [awxkit](https://docs.ansible.com/ansible-tower/latest/html/towercli/index.html) note `-k` will be required for untrusted certs. See link for full list of api commands.

`pip install -r requirements.txt` you can do this in a virtual env for testing
```bash
. scripts/set-awxkit-env.sh
```
Now run `awx config`
```json
{
     "base_url": "https://awx.example.com:32208",
     "token": "JtCONrNouQwGmjwAeYepkVxA4MKWVv",
     "use_sessions": false,
     "credentials": {
          "default": {
               "username": "admin",
               "password": "<pass>"
          }
     }
}
```
Test awx is responding `awx ping -k` 
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
Current user info `awx me -k`
```json
{
     "count": 1,
     "next": null,
     "previous": null,
     "results": [
          {
               "id": 1,
               "type": "user",
               "url": "/api/v2/users/1/",
               "related": {
                    "teams": "/api/v2/users/1/teams/",
                    "organizations": "/api/v2/users/1/organizations/",
                    "admin_of_organizations": "/api/v2/users/1/admin_of_organizations/",
                    "projects": "/api/v2/users/1/projects/",
                    "credentials": "/api/v2/users/1/credentials/",
                    "roles": "/api/v2/users/1/roles/",
                    "activity_stream": "/api/v2/users/1/activity_stream/",
                    "access_list": "/api/v2/users/1/access_list/",
                    "tokens": "/api/v2/users/1/tokens/",
                    "authorized_tokens": "/api/v2/users/1/authorized_tokens/",
                    "personal_tokens": "/api/v2/users/1/personal_tokens/"
               },
               "summary_fields": {
                    "user_capabilities": {
                         "edit": true,
                         "delete": false
                    }
               },
               "created": "2021-04-07T10:44:39.128247Z",
               "username": "admin",
               "first_name": "",
               "last_name": "",
               "email": "test@example.com",
               "is_superuser": true,
               "is_system_auditor": false,
               "ldap_dn": "",
               "last_login": "2021-04-07T11:38:11.322417Z",
               "external_account": null,
               "auth": []
          }
     ]
}
```
