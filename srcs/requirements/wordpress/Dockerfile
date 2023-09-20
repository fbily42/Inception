# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fbily <fbily@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/17 19:39:35 by fbily             #+#    #+#              #
#    Updated: 2023/09/20 16:40:34 by fbily            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
RUN apt-get update
RUN apt install php-fpm  -y
RUN mkdir /run/php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./conf/index.php    /var/www/html/wordpress/index.php

RUN chmod +x /var/www/html/wordpress/index.php

EXPOSE 9000 

ENTRYPOINT ["/usr/sbin/php-fpm7.3","-F" ]