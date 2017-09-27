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

# Env
VM_NAME="Char"

# Create a VM using the virtualbox diver.
docker-machine create --driver=virtualbox $VM_NAME

# Get the IP address of the VM.
VM_IP=$(docker-machine ip $VM_NAME)

# Define the variables of the VM in the general env of the terminal.
docker-machine env $VM_NAME
eval $(docker-machine env "$VM_NAME")

#------------------------------------------------------------------------------#

# Error handling! (check if everything ok)

# Gets the hello-world container from Docker Hub.
docker pull hello-world

# Runs the hello-world container.
docker run hello-world

# Remove the hello-world container.
docker rm hello-world

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

# Get internal IP address of the container
SERVER_IP=docker inspect -f '{{ .NetworkSettings.IPAddress }}' $SERVER_ID

#------------------------------------------------------------------------------#

# Alpine Linux (for shell scripts)

# Pulls the container.
docker pull alpine

# Runs a shell from stdin, and deletes itself one its execution is done.
docker run -it --rm alpine /bin/ash

#------------------------------------------------------------------------------#

# Debian Linux (for C code)

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

# Init Volume

# Env.
VOLUME_NAME="hatchery"

# Create a volume.
docker volume create $VOLUME_NAME

# List all the volumes created on the machine.
docker volume ls

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
