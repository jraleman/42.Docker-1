#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    clean.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/03 03:29:50 by jaleman           #+#    #+#              #
#    Updated: 2017/08/03 03:29:58 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

for machines in 'Char' 'Aiur' ; do
    eval $(docker-machine env "$machines") ;
    docker ps -aq ;
    docker stop $(docker ps -aq) ;
    docker rm $(docker ps -aq) ;
    yes | docker-machine rm $(docker-machine ls --format "{{.Name}}") ;
done

exit ;
