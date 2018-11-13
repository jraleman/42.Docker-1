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

source "00_how_to_docker/_vars" ;

for machine in "Char" "Aiur" ; do
    docker ps -aq &>/dev/null ;
    docker stop $(docker ps -aq) &>/dev/null ;
    docker rm $(docker ps -aq) &>/dev/null ;
    yes | docker-machine rm $(docker-machine ls --format "$machine") &>/dev/null ;
done

exit ;
