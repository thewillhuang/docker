############################################################
# Dockerfile to build NODE and Git container images
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER thewillhuang

# install dependencies
RUN apt-get update && apt-get install -y \
      curl \
      npm \
      nodejs \
      git;

# compatibility fix for node on ubuntu
RUN ln -s /usr/bin/nodejs /usr/bin/node;

# install nvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.24.1/install.sh | sh;

# invoke nvm to install node
RUN cp -f ~/.nvm/nvm.sh ~/.nvm/nvm-tmp.sh; \
    echo "nvm install 0.12.2; nvm alias default 0.12.2" >> ~/.nvm/nvm-tmp.sh; \
    sh ~/.nvm/nvm-tmp.sh; \
    rm ~/.nvm/nvm-tmp.sh;

RUN npm install -g gulp bower
