#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    _ENV.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/03 03:29:50 by jaleman           #+#    #+#              #
#    Updated: 2017/08/03 03:29:58 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Declare enviroment variables.
declare VM_NAME
declare VM_IP
declare SERVER_ID
declare SERVER_IP
declare DATABASE_ID
declare WORDPRESS_ID
declare PHPMYADMIN_ID

# Export enviroment variables.
export VM_NAME="Char"
export SERVER_NAME="overlord"
export SERVER_PORT="5000"
export VOLUME_NAME="hatchery"
export DATABASE_NAME="zerglings"
export DATABASE_PASS="Kerrigan"
export DATABASE_CONTAINER="spawning-pool"
export WORDPRESS_CONTAINER="lair"
export WORDPRESS_PORT="8080"
export PHPMYADMIN_PORT="8081"
export PHPMYADMIN_NAME="roach-warden"
