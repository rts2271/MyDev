FROM nginxinc/nginx-unprivileged:latest
ARG ARG_USER
ARG ARG_USERID
ARG ARG_GROUP
    
USER root
RUN adduser --uid $ARG_USERID $ARG_USER --disabled-password	
RUN apt-get update &&\
    apt-get install --no-install-recommends --assume-yes --quiet ca-certificates \
    curl wget git zip
	
USER $ARG_USER
RUN mkdir /home/$ARG_USER/.nvm
ENV NVM_DIR="/home/$ARG_USER/.nvm"
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.39.1/install.sh | bash \
	&& . $NVM_DIR/nvm.sh \
	&& nvm install v18.20.4 \
  	&& nvm install v20.19.5\
    && nvm install v22.19.0 \
    && nvm alias default v22.19.0 \
    && nvm use default \
	&& npm install --global yarn \
	&& npm install --global @adobe/aio-cli
	