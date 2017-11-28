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
# https://docs.docker.com/docker-for-mac/install/
# https://docs.docker.com/engine/reference/builder/
# https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/
# https://www.youtube.com/watch?v=hnxI-K10auY

#------------------------------------------------------------------------------#
# From an alpine image you’ll add to your container your favorite text editor,
# vim or emacs, that will launch along with your container.
# Test(s):
# ```
#   > docker build -t ft_vim .
#   > docker run -it ft_vim
# ```
#------------------------------------------------------------------------------#

# Specify the base image from the docker build.
FROM  alpine

# Downloads vim and write hello world! into a text file.
RUN   apk add --update vim
RUN   echo "hello world!" >> hello-world.txt

# Open hello-world.txt with Vim.
ENTRYPOINT ["vim", "hello-world.txt"]
