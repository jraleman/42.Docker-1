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

# Check README file! School made me do this I guess?
MAINTAINER  Jose Ramon Aleman

# Specifies Google Cloud SDK and Prestashop with frm borth as Base Image
FROM        google/cloud-sdk:latest as nightly-storage
FROM        prestashop/base:5.5-fpm

# Enviroment variables
ENV         PS_VERSION    nightly

# Copy GCSDK to prestashop package
RUN         gsutil cp `gsutil ls gs://prestashop-core-nightly/ \
              | grep .zip \
              | tail -1` /tmp/prestashop.zip

# Install the GCSDK
COPY        --from=nightly-storage /tmp/prestashop.zip /tmp/prestashop.zip

# Extract Prestashop package
RUN         mkdir -p /tmp/data-ps \
            && unzip -q /tmp/prestashop.zip -d /tmp/data-ps/ \
            && bash /tmp/ps-extractor.sh /tmp/data-ps \
            && rm /tmp/prestashop.zip
