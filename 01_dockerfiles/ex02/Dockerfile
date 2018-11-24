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

#------------------------------------------------------------------------------#
# You are going to create your first Dockerfile to containerize Rails
# applications. That’s a special configuration: this particular Dockerfile
# will be generic, and called in another Dockerfile, that will look something
# like this:
#   > FROM        ft-rails:5.0.2-on-build
#   > CMD         ["rails", "s", "-b", "0.0.0.0"]
# Your generic container should install, via a ruby container,
# all the necessary dependencies and gems, then copy your rails application
# in the /opt/app folder of your container. Docker has to install the
# approtiate gems when it builds, but also launch the migrations and the
# db population for your application. The child Dockerfile should launch
# the rails server.
#
# Tests
#   30 Fibonacci Numbers Without Using Numbers In Ruby
#     > s=' '.ord;a=s%b=s/s
#     > b.upto(s-b-b){|x|p "#{x} #{a=b+b=a}"}
#------------------------------------------------------------------------------#

# Ruby container
FROM              ruby

# Install rails and create the rails application path.
RUN               apt-get update \
                  && apt-get upgrade -y \
                  && apt-get install -y \
                      build-essential \
                      sqlite3 \
                      nodejs
RUN               gem install rails \
                  && gem install bundler \
RUN               mkdir /opt/app

# Add the application to the application path.
ONBUILD WORKDIR   /opt/app
ONBUILD ADD       . /opt/app

# Default Ruby on Rails port number
ONBUILD EXPOSE    3000

# Install all of the required gems
ONBUILD RUN       bundle install

# Runs migrations that have not run yet and runs the db/seed.rb file.
ONBUILD RUN       rake db:migrate && rake db:seed
