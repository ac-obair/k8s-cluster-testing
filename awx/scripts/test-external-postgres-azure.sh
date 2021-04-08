# external db running outside of k8s
PASSWORD="LetjIma1o3uQYbs2cq1GJYkI!"
HOST=awx-external-postgres.postgres.database.azure.com
USER=psqladminun@awx-external-postgres
DBNAME=awx

docker run -it --rm --name psql-test-connection -e PGPASSWORD=${PASSWORD} postgres psql -h ${HOST} -U ${USER} -d ${DBNAME} -c '\conninfo'
docker run -it --rm --name psql-test-connection -e PGPASSWORD=${PASSWORD} postgres psql -h ${HOST} -U ${USER} -d ${DBNAME} --list
docker run -it --rm --name psql-test-connection -e PGPASSWORD=${PASSWORD} postgres psql -h ${HOST} -U ${USER} -d ${DBNAME} -c '\dt'
