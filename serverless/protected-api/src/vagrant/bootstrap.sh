#!/bin/bash
################################################################################
# This script is called by Vagrant and used to set up an Ubuntu VM to
# provision the environment to build and deploy the protected API.
################################################################################

sudo adduser vagrant vboxsf
apt-get update
apt-get install -y jq python-pip zip
apt-get install -y python3 python3-pip

pip install awscli

#
# Installation steps for SAM CLI
# NOTE: As of 2019-11-17, the official AWS Serverless Application Model
#       developer guide still recommends installing the SAM CLI with Homebrew.
#       A simple pip install aws-sam-cli works perfectly and does not bloat
#       the system with additional redundant downloads like a whole Python3
#       environment.
#
apt-get install -y docker.io
usermod -aG docker vagrant
pip install aws-sam-cli

#sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
#test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
#test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
#test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
#echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile




