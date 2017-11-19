#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    00_install-dependencies.sh                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/03 03:29:50 by jaleman           #+#    #+#              #
#    Updated: 2017/08/03 03:29:58 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#------------------------------------------------------------------------------#
# 0. Install all the dependencies. ;)
#------------------------------------------------------------------------------#

# Check if the user uses a Mac.
if [ $(uname -s) = "Darwin" ] ; then
    echo " > Updating / installing dependencies..."
    # protect all of this, if one fails, just abort abort!!! lol !!!
    brew update
    brew tap phinze/homebrew-cask && brew install brew-cask;
    brew install docker
    brew install docker-machine
    brew cask install vagrant;
    brew cask install virtualbox;
    brew install shc
fi
