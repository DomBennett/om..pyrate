# EOL April 2023
FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    wget python2.7 python-numpy python-scipy
    
RUN wget https://github.com/dsilvestro/PyRate/archive/master.tar.gz && \
    tar zxvf master.tar.gz && rm master.tar.gz

WORKDIR /PyRate-master
