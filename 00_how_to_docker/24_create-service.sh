#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    24_create-service.sh                               :+:      :+:    :+:    #
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
# 24. Launch a rabbitmq SERVICE that will be named orbital-command.
# You should define a specific user and password for the RabbitMQ service,
# they can be whatever you want. This service will be on the overmind network.
#------------------------------------------------------------------------------#

# Create a new service.
# https://docs.docker.com/engine/reference/commandline/service_create/
docker service create --name $SERVICE_NAME \
                      --network $OVERLAY_NETWORK \
                      -e RABBITMQ_DEFAULT_USER=$SERVICE_USER \
                      -e RABBITMQ_DEFAULT_PASS=$SERVICE_PASS \
                      rabbitmq
