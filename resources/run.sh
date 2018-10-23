#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    run.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/03 03:29:50 by jaleman           #+#    #+#              #
#    Updated: 2017/08/03 03:29:58 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [[ $# -eq 0 ]] ; then
	echo "Usage: sh $0 <path-to-docker-files>"
	exit 0
fi

declare n=0
declare prefix=0
declare filepath=$1
declare count=$(ls -l ${filepath} | grep ^- | wc -l)
declare filenames=(${filepath}/*)
declare -a array=(
                  # Pre-setup
                  "Install required dependencies"
                  # Machines
                  "Create a new docker machine"
                  "Get IP of a machine"
                  "Define variables"
                  # Containers
                  "Create a new pull container"
                  "Run a container"
                  "Create nginx container"
                  "Get the IP address of a container"
                  "Launch Alpine Linux container"
                  "Launch Debian container"
                  # Volumes
                  "Create volumes"
                  "List volumes"
                  # Container types
                  "MySQL Container"
                  "Print container variables"
                  "Wordpress Container"
                  "PHPMyAdmin container"
                  "Container operations"
                  "Database logs"
                  "Display container"
                  "Restart container"
                  # Swarms
                  "Create swarm"
                  "Create a second Docker machine"
                  "Join swarm"
                  "Overlay network"
                  # Services
                  "Create service"
                  "List services"
                  "Service replicas"
                  "Service logs"
                  "A second service replica"
                  "Service task"
                  "Service scale"
                  # Delete
                  "Service delete"
                  "Containers delete"
                  "Images delete"
                  "Machine delete"
                  )

for n in {00..34}; do
	echo "Running     :" ${filenames[$n]}
	echo "Description :" ${array[$n]}
	source ${filepath}/$(printf "%02d\n" "$((10#$n))")
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
done

# Create log file out of stdout
