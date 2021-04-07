# for testing
PASSWORD=$(kubectl get secrets -n default awx-admin-password -o template --template={{.data.password}} | base64 -d)
export TOWER_HOST=https://awx.example.com:32208
export TOWER_USERNAME=admin 
export TOWER_PASSWORD=${PASSWORD}
