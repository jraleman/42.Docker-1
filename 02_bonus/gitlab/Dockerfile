# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jaleman <jaleman@student.42.us.org>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/06 22:40:52 by jaleman           #+#    #+#              #
#    Updated: 2018/11/06 22:40:53 by jaleman          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Check README file! School made me do this I guess?
MAINTAINER  Jose Ramon Aleman

# Specifies Ubuntu v14.04 as Base Image
FROM        ubuntu:14.04

# Install required packages
RUN         set -ex \
            && apt-get update -q && DEBIAN_FRONTEND=noninteractive \
            && apt-get install -yq --no-install-recommends \
                            ca-certificates \
                            openssh-server \
                            wget \
                            apt-transport-https \
                            vim \
                            nano

# Download and install Gitlab
RUN         set -ex \
            echo "deb https://packages.gitlab.com/gitlab/gitlab-ce/ubuntu/ `lsb_release -cs` main" \
                    > /etc/apt/sources.list.d/gitlab_gitlab-ce.list \
            && wget -q -0 - https://packages.gitlab.com/gpg.key | apt-key add -
            && apt-get update && apt-get install -yq --no-install-recommends gitlab-ce

# Manage SSHD through runit
RUN         set -ex \
            && mkdir -p /opt/gitlab/sv/sshd/supervise \
            && mkfifo /opt/gitlab/sv/sshd/supervise/ok \
            && printf "#!/bin/sh\nexec 2>&1\numask 077\nexec /usr/sbin/sshd -D" \
                        > /opt/gitlab/sv/sshd/run \
            && chmod a+x /opt/gitlab/sv/sshd/run \
            && ln -s /opt/gitlab/sv/sshd /opt/gitlab/service \
            && mkdir -p /var/run/sshd

# Disable in using DNS in ssh, because it tends to slow connecting
RUN         set -ex \
            && echo "UseDNS no" >> /etc/ssh/sshd_config

# Prepare default configuration
RUN         ( \
              echo "" \
              && echo "# Docker options"  \
              && echo "# Prevent Postgres from trying to allocate 25% of total memory" \
              && echo "postgresql['shared_buffers'] = '1MB'" \
            ) >> /etc/gitlab/gitlab.rb \
            && mkdir -p /assets/  \
            && cp /etc/gitlab/gitlab.rb /assets/gitlab.rb

# Expose web & ssh ports (https, http, ssh)
EXPOSE      443 80 22

# Define data volumes
VOLUME      ["/etc/gitlab", "/var/opt/gitlab", "/var/log/gitlab"]

# Copy assets
COPY        assets/wrapper /usr/local/bin/

# Wrapper to handle signal, trigger runit and reconfigure GitLab
CMD         ["/usr/local/bin/wrapper"]
