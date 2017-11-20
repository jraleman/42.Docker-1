#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    15_phpmyadmin-container.sh                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/03 03:29:50 by jaleman           #+#    #+#              #
#    Updated: 2017/08/03 03:29:58 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Include exported enviroment variables
. "./_ENV.sh"

#------------------------------------------------------------------------------#
# 15. Launch a phpmyadmin container as a background task.
# It should be named roach-warden, its 80 port should be bound to the 8081 port
# of the virtual machine and it should be able to explore the database stored
# in the spawning-pool container.
#------------------------------------------------------------------------------#

# Pulls the docker container.
docker pull phpmyadmin

# Launch a phpmyadmin container as a background task.
PHPMYADMIN_ID=$(docker run --detach \
                           --name $PHPMYADMIN_NAME \
                           --publish $PHPMYADMIN_PORT:80 \
                           --link $DATABASE_CONTAINER:db phpmyadmin/phpmyadmin)
export PHPMYADMIN_ID
