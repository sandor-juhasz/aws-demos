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
#       the system with additional redundant downloads like a whole Python3.7
#       environment. The Python3.7 environment is still needed to build and test
#       the Python3.7 Lambda functions.
#
# NOTE: The SAM CLI does not support installations on Python 2.7. When installed
#       on a Python 2.7 runtime, a red error message is displayed guiding the user
#       to follow the official Homebrew-based installation procedure.
#
# NOTE: The Python runtime matching the Lambda runtimes should be installed on
#       the Vagrant VM. In this case, Python 3.7. The default Python 3
#       implementation on Ubuntu Bionic is Pyhton 3.6.8 and it is mandatory to
#       support APT and other Linux tools.
#
# References:
#   - https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install-linux.html
#   - https://github.com/awslabs/aws-sam-cli/issues/1424
#
################################################################################
#apt-get install -y jq python-pip zip

apt-get install -y python3 python3-pip python3.7
apt-get install -y docker.io
usermod -aG docker vagrant
pip3 install awscli
pip3 install aws-sam-cli

################################################################################
# Installing Python3 for project dependent development.
################################################################################

