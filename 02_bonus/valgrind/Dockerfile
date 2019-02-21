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

# Get and install all packages: vim, gcc, valgrind
RUN  	set -ex \
		&& apt-get update -y \
		&& apt-get upgrade -y \
	 	&& apt-get install vim -y \
	 	&& apt-get install gcc -y \
	 	&& apt-get install valgrind -y 

# Add a c test file with memory leaks
ADD     ./leaks.c /leaks.c

# Check if the file is valid
RUN 	cat leaks.c

# Compile and run valgrind
RUN 	["gcc", "-Wall", "-Wextra", "-Werror", "-g", "-o", "leaks", "leaks.c"]
CMD 	["valgrind", "--leak-check=yes", "./leaks"]