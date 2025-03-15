#!/bin/bash

####################################################################################################

#Author: Haren Sah
#Version: v0.0.1

# Script to automate the process of listing all the resources in an aws account
#
# Below are the services that are supported by this script(may add more services later)
# 1. EC2
# 2. S3
#
# The script will prompt the user to enter AWS region and the service for which need to be listed
#
#
# Usage: ./aws_resource_list.sh <aws_region> <aws_service>
# Example: ./aws_resource_list.sh ap-southeast-2 ec2

####################################################################################################

if [ $# -ne 2 ]; then
          echo "Usage: ./aws_resource_list.sh  <aws_region> <aws_service>"
          echo "Example: ./aws_resource_list.sh us-east-1 ec2"
          exit 1
fi

#check if awscli installed
if [ ! aws --version ] &>/dev/null; then
          echo "awscli is not installed"
          exit 1
fi

echo "cli is installed"

#check if awscli is configured
if [ ! ~/.aws ]; then
          echo "awscli is not comfigured"
          exit 1
fi
echo "cli is configured"

#codes to check aws resources
#check for ec2

#Check if awscli is authenticated before proceeding
aws sts get-caller-identity --output json &>/dev/null
if [ $? -ne 0 ]; then
          echo "AWS CLI is not configured or credentials are invalid."
          exit 1
fi

#Disply AWS account details before running
account_ID=$(aws sts get-caller-identity --query "Account" --output text)
echo "Running script under AWS Account: ${account_ID}"

aws_region=$1
aws_service=$2

case $aws_service in
ec2) #lists EC2 instances
          echo "Listing EC2 Instances in $aws_region"
          aws ec2 describe-instances --region $aws_region
          ;;

s3) #Lists buckets
          echo "Listing S3 Buckets in $aws_region"
          aws s3api list-buckets --region $aws_region
          ;;

iam) # Lists IAM users
          log "Listing IAM Users"
          aws iam list-users --output table
          ;;
lambda) ## Lists Lambda functions
          log "Listing Lambda Functions"
          aws lambda list-functions --output table
          ;;

*)
          echo "Invalied service, Enter valid service."
          exit 1
          ;;

esac

log() {
          echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a aws_resource_list.log
}
