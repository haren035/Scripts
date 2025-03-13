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

