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
. "./_ENV.sh"

# wtf is this?
shopt -s nullglob

# Local variables
declare n=0
declare prefix=0
# declare filenames=(*)
declare filenames=(../00_how_to_docker/*)


# declare description=(*) <- define list array
# brew install
# parse package.json ???

# Pre-setup
# Install required dependencies

# Machine
# Create a new docker machine
# Get IP of a machine
# Define variables

# Container
# Create a new pull container
# Run a container
# Create nginx container
# Get the IP address of a container
# Launch Alpine Linux container
# Launch Debian container

# Volumes
# Create volums
# List volumes

declare count=$(ls -l | grep ^- | wc -l)

while [[ $n -le $count ]]; do
  prefix="${filenames[$n]:0:2}"
#  if [[ $prefix =~ [1-9]+ ]]; then
  if [[ $prefix =~ [0-9]+ ]]; then
    echo "Running     :" ${filenames[$n]}
    echo "Description :" ${descriptionList[$n]}
    echo "..."
    . ${filenames[$n]}

    # Locate the files
    # ../ ${filenames[$n]}
    echo "========================================\n"
  fi
  n=$(( n+1 ))
done

# Create log file out of stdout
