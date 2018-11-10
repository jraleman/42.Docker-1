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

MAINTAINER  Jose Ramon Aleman

# Specifies Debian Linux (Jessie) as Base Image
FROM        debian:jessie

# Enviroment variables
ENV         HUGO_VERSION    0.22.1
ENV         HUGO_BINARY     hugo_${HUGO_VERSION}_Linux-64bit.deb
ENV         HUGO_BASE_URL   http://localhost:1313

# Install pygments (syntax highlight)
RUN         apt-get -qq update && DEBIAN_FRONTEND=noninteractive \
            apt-get -qq install -y --no-install-recommends \
                                python-pygments \
                                git \
                                ca-certificates \
                                asciidoc \
	          && rm -rf /var/lib/apt/lists/*

# Download and install Hugo
ADD         https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN         dpkg -i /tmp/hugo.deb \
            && rm /tmp/hugo.deb

# Create a work directory
RUN         mkdir /usr/share/blog
WORKDIR     /usr/share/blog

# Expose default Hugo port
EXPOSE      1313

# Build a site
ONBUILD ADD site/ /usr/share/blog
ONBUILD RUN hugo -d /usr/share/nginx/html

# By default, serve the site
CMD         hugo server -b ${HUGO_BASE_URL} --bind=0.0.0.0
