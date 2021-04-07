# external db running outside of k8s
PASSWORD=1234
docker volume create --name awx-external-postgres-vol
# no --rm on awx-external-postgres so that it can be stopped for testing. 
docker run --name awx-external-postgres -v awx-external-postgres-vol:/var/lib/postgresql/data -p 5432:5432 -e POSTGRES_USER=awx -e POSTGRES_DB=awx -e POSTGRES_PASSWORD=${PASSWORD} -d postgres
# test external connection locally
docker run -it --rm --name psql-test-connection -e PGPASSWORD=1234 postgres psql -h kubernetes.docker.internal -U awx -c "\conninfo"
# test external connection from within test cluster
kubectl exec -it awx-postgres-0 -n default -- /bin/bash -c "PGPASSWORD=1234 psql -h kubernetes.docker.internal -U awx -c '\conninfo'"