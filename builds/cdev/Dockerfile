FROM ubuntu:latest
ARG ARG_DOMAIN
ARG ARG_APP
ARG ARG_USER
ARG ARG_USERID
ARG ARG_GROUP

RUN useradd -m -u $ARG_USERID $ARG_USER

RUN apt-get update && \
    apt-get install -y default-jdk && \
    apt-get install -y ant && \
    apt-get clean;
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;
RUN apt-get update &&\
    apt-get install --no-install-recommends --assume-yes --quiet ca-certificates \
    curl wget git zip libpng-dev zlib1g-dev unzip gnupg gnupg2 \
	software-properties-common less cron dirmngr apt-transport-https lsb-release \ 
	libfreetype6-dev libjpeg-dev libpng-dev libmcrypt-dev \
    libicu-dev procps libxslt-dev libxml2-dev libsodium-dev libzip-dev --no-install-recommends \
	gcc g++ qt5-qmake libqt5sql5-mysql libqt5sql5-psql  libqt5sql5-odbc libqt5sql5-sqlite \
	libqt5core5a libqt5qml5 libqt5xml5 qtbase5-dev  qtdeclarative5-dev qtbase5-dev-tools \
	make cmake openssh-server default-libmysqlclient-dev libpq5 libodbc1 libmongoc-dev libbson-dev	
COPY treefrog-framework-2.8.0-2.tar.gz /root

RUN rm /webapp/tmp/treefrog.inf &&\
    cd /root &&\
    unzip treefrog-framework-2.10.1.zip &&\
    cd /root/treefrog-framework-2.10.1 &&\
	./configure --enable-debug &&\
	cd /root/treefrog-framework-2.10.1/src &&\
	make install &&\
	cd /root/treefrog-framework-2.10.1/tools &&\
	make install &&\ 
	ldconfig

