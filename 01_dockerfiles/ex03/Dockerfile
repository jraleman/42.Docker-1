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
# Docker can be useful to test an application that’s still being developed
# without polluting your libraries. You will have to design a Dockerfile that
# gets the development version of Gogs, installs it with all the dependencies
# and the necessary configurations, and launches the application, all as it
# builds. The container will be deemed valid if you can access the web client,
# and if you can interact via GIT with this container.
# Test(s):
# ```
#   > docker build --tag gogs .
#   > docker run --detach --name Gogs --publish 3000:3000 gogs
#   > docker run -it gogs
# ```
#------------------------------------------------------------------------------#

FROM    golang

EXPOSE  3000

RUN     adduser --disabled-login --gecos 'Gogs' git

RUN     apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get install mysql-server -y && \
        service mysql start && mysql -uroot -e "create database gogs"

USER    git

RUN     mkdir -p $GOPATH/src/github.com/gogits && \
        cd $GOPATH/src/github.com/gogits && \
        git clone --depth=1 -b develop https://github.com/gogits/gogs && \
        cd gogs &&\
        go build .

USER    root

CMD     service mysql start && \
        su git -c "$GOPATH/src/github.com/gogits/gogs/gogs web"
