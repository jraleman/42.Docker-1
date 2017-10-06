#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    config.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/03 03:29:50 by jaleman           #+#    #+#              #
#    Updated: 2017/08/03 03:29:58 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#------------------------------------------------------------------------------#
# 1. Create a virtual machine with docker-machine using the virtualbox driver,
# and named Char.
#------------------------------------------------------------------------------#

# Env
VM_NAME="Char"

# Create a VM using the virtualbox diver.
docker-machine create --driver=virtualbox $VM_NAME

#------------------------------------------------------------------------------#
# 2. Get the IP address of the Char virtual machine.
#------------------------------------------------------------------------------#

# Get the IP address of the VM.
VM_IP=$(docker-machine ip $VM_NAME)

#------------------------------------------------------------------------------#
# 3. Define the variables needed by your virtual machine Char in the general env
# of your terminal, so that you can run the docker ps command without errors.
#------------------------------------------------------------------------------#

# Define the variables of the VM in the general env of the terminal.
docker-machine env $VM_NAME
eval $(docker-machine env "$VM_NAME")

#------------------------------------------------------------------------------#
# 4. Get the hello-world container from the Docker Hub, where it’s available.
#------------------------------------------------------------------------------#

# Gets the hello-world container from Docker Hub.
docker pull hello-world

#------------------------------------------------------------------------------#
# 5. Launch the hello-world container, and make sure that it prints its welcome
# message, then leaves it.
#------------------------------------------------------------------------------#

# Runs the hello-world container.
docker run hello-world

# Remove the hello-world container.
docker rm hello-world

#------------------------------------------------------------------------------#
# 6. Launch an nginx container, available on Docker Hub, as a background task.
# It should be named overlord, be able to restart on its own, and have its
# 80 port attached to the 5000 port of Char.
# You can check that your container functions properly by visiting
# http://<ip-de-char>:5000 on your web browser.
#------------------------------------------------------------------------------#

# Init server
SERVER_NAME="overlord"
SERVE_PORT="5000"

# Gets the nginx container.
docker pull nginx

# Runs the container in the background (detached).
SERVER_ID=$(docker run --detach --name $SERVER_NAME \
                       --publish $VM_IP:$SERVE_PORT:80 \
                       --restart=always nginx)

#------------------------------------------------------------------------------#
# 7. Get the internal IP address of the overlord container without starting its
# shell and in one command.
#------------------------------------------------------------------------------#

# Get internal IP address of the container
SERVER_IP=docker inspect -f '{{ .NetworkSettings.IPAddress }}' $SERVER_ID

#------------------------------------------------------------------------------#
# 8. Launch a shell from an alpine container, and make sure that you can
# interact directly with the container via your terminal, and that the container
# deletes itself once the shell’s execution is done.
#------------------------------------------------------------------------------#

# Pulls the container.
docker pull alpine

# Runs a shell from stdin, and deletes itself one its execution is done.
docker run -it --rm alpine /bin/ash

#------------------------------------------------------------------------------#
# 9. From the shell of a debian container, install via the container’s
# package manager everything you need to compile C source code and push it onto
# a git repo
#------------------------------------------------------------------------------#

# Pulls the container.
docker pull debian

# Runs a shell from stdin, and deletes itself one its execution is done.
docker run -it --rm debian /bin/sh

# Install via the container’s package manager everything needed to compile
# C source code and push it onto a git repo.
apt-get update && apt-get upgrade
apt-get install -y build-essential
apt-get install -y git

#------------------------------------------------------------------------------#
# 10. Create a volume named hatchery.
#------------------------------------------------------------------------------#

# Volume name.
VOLUME_NAME="hatchery"

# Create a volume.
docker volume create $VOLUME_NAME

#------------------------------------------------------------------------------#
# 11. List all the Docker volumes created on the machine.
#------------------------------------------------------------------------------#

# List all the volumes created on the machine.
docker volume ls

#------------------------------------------------------------------------------#
# 12. Launch a mysql container as a background task. It should be able to
# restart on its own in case of error, and the root password of the database
# should be Kerrigan. You will also make sure that the database is stored in the
# hatchery volume, that the container directly creates a database named
# zerglings, and that the container itself is named spawning-pool.
#------------------------------------------------------------------------------#

# Init database
DATABASE_PASS="Kerrigan"

# Pulls the container
docker pull mysql

# Runs the container in the background (detached).
DATABASE_ID=$(docker run --detach --name $DATABASE_NAME \
                         -v /$VOLUME_NAME
                         --publish $VM_IP:$SERVE_PORT:80 \
                         --restart=always nginx)
