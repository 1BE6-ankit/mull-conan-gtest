FROM ubuntu:18.04

RUN mkdir -p /tmp/home
ENV HOME /tmp/home

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y git build-essential cmake \
    && apt-get install -y vim wget

RUN apt-get install -y python3-pip \
    && pip3 install conan

RUN apt-get update

# mull
RUN apt-get install -y sqlite3 libsqlite3-dev libncurses5-dev libxml2-dev uuid-dev libstdc++-6-dev
RUN wget https://github.com/mull-project/mull/releases/download/0.3.0/Mull-0.3.0-LLVM-8.0-ubuntu-16.04.deb
RUN dpkg -i Mull-0.3.0-LLVM-8.0-ubuntu-16.04.deb

# llvm
WORKDIR /opt/
RUN wget http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
RUN tar -xvf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
RUN ls
RUN rm clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar* 
ENV PATH=$PATH:/opt/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04/bin 
ENV CC=/opt/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04/bin/clang 
ENV CXX=/opt/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04/bin/clang++

#  error while loading shared libraries: libicui18n.so.55: .. FIX:
RUN wget http://security.ubuntu.com/ubuntu/pool/main/i/icu/libicu55_55.1-7_amd64.deb
RUN dpkg -i libicu55_55.1-7_amd64.deb
RUN rm libicu55_55.1-7_amd64.deb

RUN apt-get -f install