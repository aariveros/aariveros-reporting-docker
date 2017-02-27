find /var/lib/docker/containers/ -type f -name '*-json.log' -delete

docker-compose stop
docker rm $(docker ps -a -q --filter="name=reporting")
docker rmi $(docker images -f "dangling=true" -q)
docker-compose up -d --build