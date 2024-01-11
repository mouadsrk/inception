all:
	cd srcs && docker compose up --build -d 

clean :
	cd srcs && docker stop $$(docker ps -qa) && docker rm $$(docker ps -qa) && docker rmi -f $$(docker images -qa) && docker volume rm $$(docker volume ls -q) && docker network rm $$(docker network ls -q) 2>/dev/null  || true