#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    20_service-replicas2.sh                            :+:      :+:    :+:    #
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
# 28. Launch a 42school/marine-squad in two replicas.
# This service will be named... marines and will be on the overmind network.
#------------------------------------------------------------------------------#

# Launch a service in two replicas.
docker service create --name $SERVICE_NAME3 \
                      --network $OVERLAY_NETWORK \
                      --replicas 2 \
                      -e OC_DEFAULT_USER=$SERVICE_USER \
                      -e OC_DEFAULT_PASS=$SERVICE_PASS \
                      42school/$SERVICE_NAME3
