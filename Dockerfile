# EOL April 2023
FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    wget python2.7 python-numpy python-scipy libboost-all-dev swig

# Version 2.0 - 20180817
RUN wget https://github.com/dsilvestro/PyRate/archive/73390e727cdf42d9d07c10820a2fa730241d695c.tar.gz && \
    tar zxvf 73390e727cdf42d9d07c10820a2fa730241d695c.tar.gz && \
    rm 73390e727cdf42d9d07c10820a2fa730241d695c.tar.gz && \
    mv PyRate-73390e727cdf42d9d07c10820a2fa730241d695c PyRate

RUN cd PyRate/pyrate_lib/fastPyRateC/ModulePyrateC &&
    sh install.sh

# outsider requires working_dir
RUN mkdir /working_dir
WORKDIR /working_dir
