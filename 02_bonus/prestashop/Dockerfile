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
#   > $ docker build -t prestashop/image .
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

# Runs latest Apache version in the official PHP repository as base image
FROM      prestashop/base:5.6-apache

# Set PrestaShop version
ENV       PS_VERSION    "1.4.11.0"

# Get PrestaShop
ADD       https://www.prestashop.com/download/old/prestashop_1.4.11.0.zip /tmp/prestashop.zip

# Extract PrestaShop
RUN       set -ex \
          && mkdir -p /tmp/data-ps \
	        && unzip -q /tmp/prestashop.zip -d /tmp/data-ps/ \
	        && bash /tmp/ps-extractor.sh /tmp/data-ps \
	        && rm /tmp/prestashop.zip
