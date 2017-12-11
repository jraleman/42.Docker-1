# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/03 03:29:50 by jaleman           #+#    #+#              #
#    Updated: 2017/08/03 03:29:58 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Source:
# https://github.com/jbergknoff/Dockerfile/blob/master/redis/Dockerfile

#------------------------------------------------------------------------------#
# Minimal redis environment:
#   - Built on top of gliderlabs/alpine base image
#   - ~6 MB in size (5 MB base + 1 MB)
#   - Executes redis-server by default.
#------------------------------------------------------------------------------#

FROM	gliderlabs/alpine:3.1
RUN		apk-install redis=2.8.17-r0
EXPOSE	6379
CMD		["redis-server"]
