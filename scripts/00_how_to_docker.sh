#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    _MAIN.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/03 03:29:50 by jaleman           #+#    #+#              #
#    Updated: 2017/08/03 03:29:58 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Include exported enviroment variables
. "00_how_to_docker/_vars"

# wtf is this?
shopt -s nullglob

# Local variables
declare n=0
declare prefix=0
# declare filenames=(*)
declare filenames=("00_how_to_docker/*")
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
                  "Images Delete"
                  "Machine delete"
                  )

declare count=$(ls -l | grep ^- | wc -l)

while [[ $n -le $count ]]; do
  prefix="${filenames[$n]:0:2}"
  if [[ $prefix =~ [0-9]+ ]]; then
    echo "Running     :" ${filenames[$n]}
    echo "Description :" ${array[$n]}
    echo "..."
    . ${filenames[$n]}

    # Locate the files
    echo "========================================\n"
  fi
  n=$(( n+1 ))
done

# Create log file out of stdout
