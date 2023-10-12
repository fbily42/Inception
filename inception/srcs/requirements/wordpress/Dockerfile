# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbily <fbily@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/17 19:39:35 by fbily             #+#    #+#              #
#    Updated: 2023/10/02 17:30:34 by fbily            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y
RUN apt install unzip php curl wget redis php-redis php-mysqli php-fpm php-cgi php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
RUN apt install default-mysql-client -y
RUN mkdir /run/php

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

COPY ./tools/install.sh /home/
RUN chmod 777 /home/install.sh

EXPOSE 9000 

ENTRYPOINT ["/home/install.sh" ]