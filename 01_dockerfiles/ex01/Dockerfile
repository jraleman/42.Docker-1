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

# Sources:
# https://github.com/overshard/docker-teamspeak

#------------------------------------------------------------------------------#
# From a debian image you will add the appropriate sources to create a
# TeamSpeak server, that will launch along with your container.
# It will be deemed valid if at least one user can connect to it and engage
# in a normal discussion (no far-fetched setup), so be sure to create your
# Dockerfile with the right options. Your program should get the sources when
# it builds, they cannot be in your repository.
# Test(s):
# ```
#   > docker build -t ex01 .
#   > docker run -it -p 30033:30033 -p 9987:9987/udp -p 10011:10011 ex01
# ```
#------------------------------------------------------------------------------#

# Base system
FROM    debian

# Download and install everything from the repos.
RUN     DEBIAN_FRONTEND=noninteractive \
        set -ex \
        && apt-get -y update \
        && apt-get -y install ca-certificates bzip2 \
        && apt-get autoremove -y \
        && apt-get clean

# Enviroment variable to accept TS3 license
ENV     TS3SERVER_LICENSE   "accept"
ENV     TS3SERVER_VERSION   "3.5.0"

# Download and install TeamSpeak 3.0.13.8
ADD     http://dl.4players.de/ts/releases/${TS3SERVER_VERSION}/teamspeak3-server_linux_amd64-${TS3SERVER_VERSION}.tar.bz2 ./
RUN     set -ex \ 
        && tar jxf teamspeak3-server_linux_amd64-${TS3SERVER_VERSION}.tar.bz2 \
        && mv teamspeak3-server_linux_amd64 /opt/teamspeak \
        && rm teamspeak3-server_linux_amd64-${TS3SERVER_VERSION}.tar.bz2

# Load in all of our config files.
ADD     ./start /start

# Fix all permissions
RUN     chmod +x /start

# /start runs it.
EXPOSE  9987/udp
EXPOSE  30033
EXPOSE  10011

RUN     useradd teamspeak && mkdir /data && chown teamspeak:teamspeak /data
VOLUME  ["/data"]
USER    teamspeak
CMD     ["/start"]
