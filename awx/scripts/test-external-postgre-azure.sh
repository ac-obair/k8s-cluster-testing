# external db running outside of k8s

# az cli build db
PASSWORD=LetjIma1o3uQYbs2cq1GJYkI!
HOST=awx-external-postgres.postgres.database.azure.com
USER=awx@awx-external-postgres
DBNAME=postgres
#DBNAME=awx

TF rather than arm? do arm just to do it

kubectl exec -it awx-postgres-0 -n default -- /bin/bash -c "PGPASSWORD=${PASSWORD} psql -h ${HOST} -U ${USER} -d ${DBNAME} -c '\conninfo'"
kubectl exec -it awx-postgres-0 -n default -- /bin/bash -c "PGPASSWORD=${PASSWORD} psql -h ${HOST} -U ${USER} -d ${DBNAME} --list"