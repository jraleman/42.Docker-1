#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    07_get-overlord-ip.sh                              :+:      :+:    :+:    #
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
# 7. Get the internal IP address of the overlord container without starting its
# shell and in one command.
#------------------------------------------------------------------------------#

# Get internal IP address of the container
SERVER_IP=docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $SERVER_ID
export SERVER_IP
