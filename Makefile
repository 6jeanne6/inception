################################################################################
#                          Makefile configuration                              #
################################################################################

#Makefile to run Docker commands

#docker image ls = list images
#docker compose ps = list containers

################################################################################
#                                 	Alias                                      #
################################################################################

DOCKER_COMPOSE_FILE = srcs/docker-compose.yml

################################################################################
#                                   Colors                                     #
################################################################################

BLACK 	= \033[0;30m
RED 	= \033[0;31m
GREEN 	= \033[0;32m
YELLOW 	= \033[0;33m
BLUE 	= \033[0;34m
PURPLE 	= \033[0;35m
CYAN 	= \033[0;36m
RESET 	= \033[0m

################################################################################
#                                    Rules                                     #
################################################################################

all: build up

#build, recreate, start and attach to container for a service
#-d = detached, run containers in the background
#--build = build images before starting containers
build:
		mkdir -p /home/jewu/data/wordpress
		mkdir -p /home/jewu/data/mariadb
		@docker compose -f $(DOCKER_COMPOSE_FILE) build

#up = launch containers without having to build
up:
		@docker compose -f $(DOCKER_COMPOSE_FILE) up -d

#stop containers and removes containers, networks, volumes
#and images created by up
down:

		@docker compose -f $(DOCKER_COMPOSE_FILE) down

#stop running containers without removing them, can be started
#again with docker compose start
stop:
		@docker compose -f $(DOCKER_COMPOSE_FILE) stop

#remove all stopped containers
clean:	down
		sudo rm -rf /home/jewu/data/wordpress
		sudo rm -rf /home/jewu/data/mariadb
		@docker container prune --force

#remove all unused containers, networks, images(dangling and unused)
#-a = all unused images too
vclean:	clean
		@docker system prune -af

re:		vclean all

.PHONY: all build up down stop clean vclean re