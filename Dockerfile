FROM ubuntu:18.04


LABEL maintainer="BitBD <developer@nexbit.io>"
LABEL version="1.0.0.0-g"
LABEL name="Nexbit"

ENV NEXBITD_VERSION 1.0.0.0-g


RUN apt-get update
RUN apt-get upgrade
RUN apt-get autoremove
RUN apt-get install apt-utils -y
RUN apt-get install wget htop xz-utils build-essential libtool autoconf automake software-properties-common -y
RUN apt-get install protobuf-compiler git pkg-config aptitude -y
RUN apt-get install autotools-dev libssl-dev libevent-dev bsdmainutils  cmake libboost-all-dev libgmp3-dev -y
RUN apt-get install libdb5.3++-dev -y
RUN apt-get install libminiupnpc-dev -y
RUN add-apt-repository ppa:bitcoin/bitcoin -y
RUN apt-get update
RUN wget https://github.com/nexbitproject/daemon-linux/releases/download/v1.0.0.0-g/nexbitd
RUN mkdir /root/.nexbit
COPY ./nexbitd /usr/local/bin/nexbitd
RUN chmod u+x /usr/local/bin/nexbitd


EXPOSE 13519 13520

ADD VERSION .
ADD ./bin/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod a+x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

