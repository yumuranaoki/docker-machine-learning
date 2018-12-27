FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    sudo git wget cmake nano vim gcc g++ build-essential \
    ca-certificates software-properties-common

RUN add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y python3.6 \
    && wget -O ./get-pip.py https://bootstrap.pypa.io/get-pip.py \
    && python3.6 ./get-pip.py \
    && ln -s /usr/bin/python3.6 /usr/local/bin/python3 \
    && ln -s /usr/bin/python3.6 /usr/local/bin/python

RUN pip install numpy scipy scikit-learn matplotlib pandas jupyter tensorflow keras

RUN mkdir /develop
WORKDIR /develop

COPY ./develop-host /develop