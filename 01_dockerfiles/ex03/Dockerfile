# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/06 22:40:52 by jaleman           #+#    #+#              #
#    Updated: 2018/11/06 22:40:53 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Sources:
# https://vidhyachari.wordpress.com/2017/09/01/setting-up-gogs-on-docker/
# https://github.com/rosstimson/docker-gogs

#------------------------------------------------------------------------------#
# Design a Dockerfile that gets the development version of Gogs, installs it
# with all the dependencies and the necessary configurations, and launches the
# application, all as it builds. The container will be deemed valid if you can
# access the web client, and if you can interact via GIT with this container.
# Test(s):
# ```
#   > docker build -t gogs .
#   > docker run --detach --name Gogs --publish 3000:3000 gogs
#   > docker run -it gogs
# ```
#------------------------------------------------------------------------------#

FROM	golang:1.4

ENV		GOGS_VERSION			v0.6.1
ENV		GOGS_PATH				$GOPATH/src/github.com/gogits/gogs
ENV		GOGS_CUSTOM_CONF_PATH	$GOGS_PATH/custom/conf
ENV		GOGS_CUSTOM_CONF		$GOGS_CUSTOM_CONF_PATH/app.ini

RUN 	set -ex \
		&& apt-get update \
		&& apt-get -y install openssh-server \
		&& mkdir -p /var/run/sshd \
		&& sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config \
		&& sed '/pam_loginuid.so/s/^/#/g' -i  /etc/pam.d/*

RUN		set -ex \
		&& useradd -s /bin/bash -u 2000 -m -c gogs git
RUN		set -ex \
		&& mkdir -p $GOPATH/src/github.com/gogits \
		&& git clone https://github.com/gogits/gogs.git $GOGS_PATH \
		&& cd $GOGS_PATH \
		&& git checkout -b $GOGS_VERSION \
		&& go get -tags 'redis' ./... \
		&& go build -tags 'redis' \
		&& mkdir -p $GOGS_CUSTOM_CONF_PATH \
		&& cp conf/app.ini $GOGS_CUSTOM_CONF \
		&& chown -R git $GOGS_PATH

ADD		start.sh				/start.sh
RUN		chmod +x				/start.sh

ENV		HOME					/home/git
ENV		PATH					$GOGS_PATH:$PATH
# WORKDIR $GOGS_PATH - env var expansion doesn't work here.
WORKDIR	/go/src/github.com/gogits/gogs
EXPOSE	22 3000
CMD		["/start.sh"]
