# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbily <fbily@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/17 19:39:59 by fbily             #+#    #+#              #
#    Updated: 2023/10/04 14:42:53 by fbily            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@sudo mkdir -p /home/fbily/data/database /home/fbily/data/wordpress
	@sudo docker-compose -f ./srcs/docker-compose.yml up --build -d

restart:
	@sudo docker-compose -f ./srcs/docker-compose.yml stop
	@sudo docker-compose -f ./srcs/docker-compose.yml start

down:
	@sudo docker-compose -f ./srcs/docker-compose.yml down

clean:
	@sudo docker rm -f $$(sudo docker ps -qa)
	@sudo docker volume rm -f $$(sudo docker volume ls)
	@sudo docker rmi -f $$(sudo docker image ls -q)
	@sudo rm -rf /home/fbily/data

re:
	make clean
	make all

.PHONY: all clean restart down re