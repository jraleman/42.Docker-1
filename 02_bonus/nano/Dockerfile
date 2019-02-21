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

# Pull latest debian distro
FROM 	debian:latest

# Update, upgrade and install all the necessary packages
RUN  	set -ex \
		&& apt-get update -y \
	 	&& apt-get upgrade -y \
	 	&& apt-get install nano -y \
	 	&& apt-get install git -y \
	 	&& apt-get install gcc -y

# Setup some environment variables to be used for the hello.txt
ENV 	NAME="jaleman"
ENV 	EMAIL="jraleman@42.student.us.org"
ENV 	MSG="Pico is better"

# Add the data to the hello.txt file
RUN 	set -ex \
		&& echo $NAME >> hello.txt \
		&& echo $EMAIL >> hello.txt \
		&& echo $MSG >> hello.txt

# Start the container in bash mode
CMD 	["bash"]