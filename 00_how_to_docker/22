#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    22_swarm_join.sh                                   :+:      :+:    :+:    #
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
# 22. Turn Aiur into a slave of the local swarm in which Char is leader
# (the command to take control of Aiur is not requested).
#------------------------------------------------------------------------------#

# Manage join tokens
# https://docs.docker.com/engine/reference/commandline/swarm_join-token/
SWARM_TOKEN=$(docker swarm join-token worker -q)

# Join a swarm as a node and/or manager
# https://docs.docker.com/engine/reference/commandline/swarm_join/
docker swarm join --token $SWARM_TOKEN $VM_IP:$SWARM_PORT

export SWARM_TOKEN
