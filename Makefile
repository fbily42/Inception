# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbily <fbily@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/17 19:39:59 by fbily             #+#    #+#              #
#    Updated: 2023/10/04 18:39:39 by fbily            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	@mkdir -p /home/fbily/data/database /home/fbily/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

restart:
	@docker-compose -f ./srcs/docker-compose.yml stop
	@docker-compose -f ./srcs/docker-compose.yml start

down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean:
	@docker rm -f $$(docker ps -qa)
	@docker volume rm -f $$(docker volume ls)
	@docker rmi -f $$(docker image ls -q)
	@sudo rm -rf /home/fbily/data

re:
	make clean
	make all

.PHONY: all clean restart down re