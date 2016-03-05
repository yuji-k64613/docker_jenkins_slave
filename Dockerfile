FROM debian:latest
MAINTAINER Yuji Konishi

RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y curl
RUN apt-get install -y unzip
RUN apt-get install -y openjdk-7-jdk
RUN apt-get install -y maven
RUN apt-get install -y gradle

ADD script.sh /tmp/script.sh
CMD [ "/tmp/script.sh" ]
