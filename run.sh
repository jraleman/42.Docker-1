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

# Declare variables
declare n=0 ;
declare prefix=0 ;
declare filepath="./00_how_to_docker" ;
declare filenames=(${filepath}/*) ;
declare cleanScript="./resources/clean.sh" ;
declare count=$(ls -l | grep ^- | wc -l) ;
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
                  ) ;

# Start fresh
echo "Starting up..."
sh ${cleanScript} ;
source "${filepath}/_vars" ;

# Execute the scripts, one by one
for n in {00..34}; do
  echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" ;
	echo "Running     :" ${filenames[$n]} ;
	echo "Description :" ${array[$n]} ;
  cd ${filepath} ;
  if [ $n -gt 3 ] ; then
    eval $ENV_VAR ;
  fi
	sh $(printf "%02d\n" "$((10#$n))") ;
  cd ../ ;
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" ;
done

# Create log file out of stdout

exit ;
