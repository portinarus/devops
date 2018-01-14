docker login

echo pulling latest images
docker-compose pull

echo logging out of docker
docker logout

echo making development directories

echo checking dangling images
if [ $(docker images -f "dangling=true" -q | wc -l ) -gt 0 ] 
then
	echo removing dangling images
	docker rmi $(docker images -f "dangling=true" -q)
else
	echo no dangling images
fi
