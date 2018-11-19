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

#------------------------------------------------------------------------------#
# PrestaShop is a free and open-source e-commerce web application, committed to
# providing the best shopping cart experience for both merchants and customers.
# It is written in PHP, is highly customizable, supports all the major payment
# services, is translated in many languages and localized for many countries,
# has a fully responsive design (both front and back office), etc.
#
# Run it:
#   > $ docker build -t hugo .
#   > $ docker network create prestashop-net
#   > $ docker run -ti \
#                  --name example-mysql \
#                  --network prestashop-net \
#                  -e MYSQL_ROOT_PASSWORD=admin \
#                  -p 3307:3306 \
#                  -d mysql:5.7
#   > $ docker run -ti \
#                  --name example-prestashop \
#                  --network prestashop-net \
#                  -e DB_SERVER=example-mysql -p 8080:80 \
#                  -d prestashop/image
#------------------------------------------------------------------------------#

# Specifies Debian Linux (Jessie) as Base Image
FROM        debian:jessie

# Enviroment variables
ENV         HUGO_VERSION        "0.51"
ENV         HUGO_BINARY         "hugo_${HUGO_VERSION}_Linux-64bit.deb"
ENV         HUGO_BASE_URL       "http://localhost:1313"

# Install pygments (syntax highlight)
RUN         set -ex \
            && apt-get update  \
            && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
            		python-pygments \
                git \
                ca-certificates \
                asciidoc \
	          && rm -rf /var/lib/apt/lists/*

# Download and install Hugo
ADD         https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN         set -ex \
						&& dpkg -i /tmp/hugo.deb \
            && rm /tmp/hugo.deb

# Create a work directory
RUN         mkdir 							/usr/share/blog
WORKDIR     /usr/share/blog

# Expose default Hugo port
EXPOSE      1313

# Build a site
ONBUILD ADD site/               /usr/share/blog
# ONBUILD RUN hugo new /usr/share/blog
ONBUILD RUN hugo -d             /usr/share/nginx/html

# By default, serve the site
CMD         ["hugo", "server -b ${HUGO_BASE_URL} --bind=0.0.0.0"]
