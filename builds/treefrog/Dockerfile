FROM buildpack-deps:jammy-curl
MAINTAINER AOYAMA Kazuharu <a.kazuharu@gmail.com>

ENV TREEFROG_VERSION 2.8.0
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive

ARG ARG_DOMAIN
ARG ARG_APP
ARG ARG_USER
ARG ARG_USERID
ARG ARG_GROUP

RUN useradd -m -u $ARG_USERID $ARG_USER

RUN apt-get update -q; apt-get install -yq --no-install-recommends \
 qt5-qmake libqt5sql5-mysql libqt5sql5-psql \
 libqt5sql5-odbc libqt5sql5-sqlite libqt5core5a libqt5qml5 libqt5xml5 qtbase5-dev \
 qtdeclarative5-dev qtbase5-dev-tools gcc g++ make cmake tzdata \
 coreutils pkg-config libpq5 libodbc1 libmongoc-dev libbson-dev gcc g++ clang make  \
 libmysqlclient-dev libpq5 libodbc1 libmongoc-dev libbson-dev

WORKDIR /usr/src/treefrog
COPY treefrog-framework-2.8.0-2.tar.gz /usr/src/treefrog
RUN tar xvzf treefrog-framework-2.8.0-2.tar.gz && \
    cd treefrog-framework-2.8.0-2 && \
    ./configure --enable-shared-mongoc --spec=linux-clang && \
    make -j"$(nproc)" -C src && \
    make -C src install && \
    make -j"$(nproc)" -C tools && \
    make -C tools install && \
    rm -rf /usr/src/treefrog

USER $ARG_USER
SHELL ["/bin/bash", "--login", "-c"]
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.39.1/install.sh | bash
ENV . $NVM_DIR/nvm.sh 
ENV NVM_DIR="$HOME/.nvm"
ENV [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
RUN nvm install node \
    && corepack enable \
    && yarn

RUN echo "export NVM_DIR=$HOME/.nvm" >> $HOME/.bashrc
RUN echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $HOME/.bashrc
RUN echo "export PATH=$PATH:$HOME/.yarn" >> $HOME/.bashrc

RUN npm -v
RUN node -v	

VOLUME  /webapp
WORKDIR /webapp
EXPOSE  8800
CMD ["treefrog", "-p", "8800", "/webapp"]