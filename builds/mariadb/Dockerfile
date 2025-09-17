FROM mariadb:10.2
ARG ARG_USER
ARG ARG_USERID
RUN useradd -m -u $ARG_USERID $ARG_USER
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN sed -i 's/DOCKERUSER/'$ARG_USER'/g' /etc/mysql/mariadb.conf.d/50-server.cnf
USER $ARG_USER

