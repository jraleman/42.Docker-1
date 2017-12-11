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
# https://github.com/kstaken/dockerfile-examples/blob/master/apache/Dockerfile

#------------------------------------------------------------------------------#
# A basic apache server. To use either add or bind mount content under /var/www
#------------------------------------------------------------------------------#

# ...
FROM    debian

# ...
RUN     apt-get update && \
        apt-get install -y apache2 && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

# ...
ENV     APACHE_RUN_USER www-data
ENV     APACHE_RUN_GROUP www-data
ENV     APACHE_LOG_DIR /var/log/apache2

# ...
EXPOSE  80

# ...
CMD     ["/usr/sbin/apache2", "-D", "FOREGROUND"]
