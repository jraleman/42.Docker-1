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

# # Specifies Alpine Linux as Base Image
# FROM        alpine
#
# # Enviroment variables
# ENV         LANG      "en_US.utf8"
# ENV         PGDATA    "/var/lib/postgresql/data"
#
# # Add edge to apk repositories,
# # having the current development tree of Alpine Linux
# RUN         set -ex \
#             && echo "@edge http://nl.alpinelinux.org/alpine/edge/main" \
#                 >> /etc/apk/repositories \
#             && apk update ;
#
# # Add curl, download packages
# RUN         set -ex \
#             && apk add curl \
#                 "libpq" \
#                 "postgresql-client" \
#                 "postgresql" \
#                 "postgresql-contrib" \
#             && curl -o /usr/local/bin/gosu -sSL \
#                 "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64" \
#             && chmod +x /usr/local/bin/gosu ;
#
# # WTF... IS THIS NECESSARIES?
# # RUN         mkdir /docker-entrypoint-initdb.d
#
# # Remove curl, clean stuff
# RUN         set -ex \
#             && apk del curl \
#             && rm -rf /var/cache/apk/* ;
#
# # Mount point with the specified name and marks externally mounted volumes
# VOLUME      ${PGDATA}
#
# # Create entrypoint, expose port, and execute container
# COPY        docker-entrypoint.sh /entrypoint.sh
# ENTRYPOINT  ["/entrypoint.sh"]
# EXPOSE      5432
# CMD         ["postgres"]

#


# docker build -t postgres/image .
# docker run --name example-postgres -e POSTGRES_PASSWORD=gaetan69 -d postgres/image

FROM        alpine

RUN         set -ex \
            && echo "http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
            apk update && \
            apk add "curl" "libpq" "postgresql-client" "postgresql" "postgresql-contrib" && \
            mkdir /docker-entrypoint-initdb.d && \
            curl -o /usr/local/bin/gosu -sSL "https://github.com/tianon/gosu/releases/download/1.2/gosu-amd64" && \
            chmod +x /usr/local/bin/gosu && \
            apk del curl && \
            rm -rf /var/cache/apk/*

ENV         LANG      "en_US.utf8"
ENV         PGDATA    "/var/lib/postgresql/data"

VOLUME      /var/lib/postgresql/data
COPY        entrypoint.sh /

ENTRYPOINT  ["/entrypoint.sh"]
EXPOSE      5432
CMD         ["postgres"]
