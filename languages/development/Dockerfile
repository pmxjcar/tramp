FROM ubuntu
ADD VERSION .

# RUN  apt-get update -y
RUN  apt-get upgrade -y
RUN  apt-get dist-upgrade -y 
RUN  apt-get -y autoremove 
RUN  apt-get clean

RUN apt-get install -y dos2unix sudo zip unzip curl wget vim git gcc 


EXPOSE 22
