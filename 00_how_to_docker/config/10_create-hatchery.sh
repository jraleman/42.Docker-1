#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    10_create-hatchery.sh                              :+:      :+:    :+:    #
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
# 10. Create a volume named hatchery.
#------------------------------------------------------------------------------#

# Volume name.
VOLUME_NAME="hatchery"

# Create a volume.
docker volume create $VOLUME_NAME
