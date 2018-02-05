from ubuntu:xenial

run dpkg --add-architecture i386
run apt-get update &&									\
    apt-get install -y virtualenvwrapper python2.7-dev build-essential libxml2-dev libxslt1-dev git libffi-dev cmake libreadline-dev libtool debootstrap debian-archive-keyring libglib2.0-dev libpixman-1-dev libqt4-dev graphviz-dev binutils-multiarch nasm libc6:i386 libgcc1:i386 libstdc++6:i386 libtinfo5:i386 zlib1g:i386 vim python-pip python3-pip gdb python-capstone locales

run pip install --upgrade pip
run pip install --upgrade pwntools
run pip3 install capstone scipy pyelftools unicorn keystone-engine ropper retdec-python

run wget -q -O- https://github.com/hugsy/gef/raw/master/gef.sh | sh

run mkdir /challenge

ENV LANG en_US.UTF-8
ENV LC_ALL=C.UTF-8
ENV PYTHONIOENCODING=utf8

WORKDIR /challenge

CMD /bin/bash 


