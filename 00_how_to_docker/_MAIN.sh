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

shopt -s nullglob

declare n=0
declare prefix=0
declare filenames=(*)
declare count=$(ls -l | grep ^- | wc -l)

while [[ $n -le $count ]]; do
  prefix="${filenames[$n]:0:2}"
  if [[ $prefix =~ [0-9]+ ]]; then
    echo "->" ${filenames[$n]}
    echo "..."
    . ${filenames[$n]}
    echo "========================================\n"
  fi
  n=$(( n+1 ))
done
