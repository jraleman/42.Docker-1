#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    02_get-machine-ip.sh                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/08/03 03:29:50 by jaleman           #+#    #+#              #
#    Updated: 2017/08/03 03:29:58 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Include exported enviroment variables
. "./_ENV.sh"

#------------------------------------------------------------------------------#
# 2. Get the IP address of the Char virtual machine.
#------------------------------------------------------------------------------#

# Get the IP address of the VM.
VM_IP=$(docker-machine ip $VM_NAME)
export VM_IP

echo "Virtual Machine $VM_NAME IP:" $VM_IP
