#!/bin/bash
################################################################################
# This script is called by Vagrant and used to set up an Ubuntu VM to
# provision the environment to build and deploy the protected API.
################################################################################

sudo adduser vagrant vboxsf
apt-get update

################################################################################
# Installation steps for AWS CLI and the SAM CLI (including Docker)
#
# NOTE: As of 2019-11-17, the official AWS Serverless Application Model
#       developer guide still recommends installing the SAM CLI with Homebrew.
#       A simple pip install aws-sam-cli works perfectly and does not bloat
#       the system with additional redundant downloads like a whole Python3
#       environment.
#
# References:
#   - https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install-linux.html
#   - https://github.com/awslabs/aws-sam-cli/issues/1424
#
################################################################################
apt-get install -y jq python-pip zip
pip install awscli
apt-get install -y docker.io
usermod -aG docker vagrant
pip install aws-sam-cli

################################################################################
# Installing Python3 for project dependent development.
################################################################################
apt-get install -y python3 python3-pip
