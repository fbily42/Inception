# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbily <fbily@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/17 19:39:59 by fbily             #+#    #+#              #
#    Updated: 2023/10/02 16:28:07 by fbily            ###   ########.fr        #
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
	@sudo rm -rf /home/fbily/data

.PHONY: all clean restart down