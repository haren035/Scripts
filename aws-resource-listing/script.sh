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
 if [ ! aws --version &> /dev/null ]; then
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

aws_service=$1
aws_region=$2
case $aws_service in
          ec2)      #lists EC2 instances
                    echo "Listing EC2 Instances in $aws_region"
                    aws ec2 describe-instances --region aws_region
                    ;;
          
          s3)       #Lists buckets
                    echo "Listing S3 Buckets in $aws_region"
                    aws s3api list-buckets --region aws_region
                    ;;
esac