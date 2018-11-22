
# EOL April 2023
FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    wget python2.7 python-numpy python-scipy swig curl unzip

# Updating version
RUN wget https://github.com/dsilvestro/PyRate/archive/master.tar.gz && \
    tar zxvf master.tar.gz && \
    rm master.tar.gz && \
    mv PyRate-master PyRate

RUN cd PyRate/pyrate_lib/fastPyRateC/ModulePyrateC && \
    bash install.sh

# outsider requires working_dir
RUN mkdir /working_dir
WORKDIR /working_dir
