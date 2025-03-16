#!/bin/bash

####################################################################################################
# Author: Haren Sah
# Version: v0.0.1
#
# Script to automate the process of listing all AWS resources in an account.
#
# Supported AWS Services:
# 1. EC2
# 2. S3
# 3. IAM
# 4. Lambda
#
# The script prompts the user to enter an AWS region and the service they want to list.
#
# Usage: ./aws_resource_list.sh <aws_region> <aws_service>
# Example: ./aws_resource_list.sh ap-southeast-2 ec2
####################################################################################################

# Validate input arguments
if [ $# -ne 2 ]; then
          echo "Usage: ./aws_resource_list.sh <aws_region> <aws_service>"
          echo "Example: ./aws_resource_list.sh us-east-1 ec2"
          exit 1
fi

# Check if AWS CLI is installed
if ! command -v aws &>/dev/null; then
          echo "AWS CLI is not installed. Install it from https://aws.amazon.com/cli/"
          exit 1
fi

# Check if AWS CLI is configured
if [ ! -d ~/.aws ]; then
          echo "AWS CLI is not configured. Run 'aws configure' first."
          exit 1
fi

# Check if AWS CLI authentication is valid
aws sts get-caller-identity --output json &>/dev/null
if [ $? -ne 0 ]; then
          echo "AWS CLI is not authenticated. Check your credentials."
          exit 1
fi

# Display AWS Account ID
account_ID=$(aws sts get-caller-identity --query "Account" --output text)
echo "Running script under AWS Account: ${account_ID}"

aws_region=$1
aws_service=$2

case $aws_service in
ec2) # List EC2 instances
          log "Listing EC2 Instances in $aws_region"
          aws ec2 describe-instances --region "$aws_region" --query 'Reservations[].Instances[].{InstanceId: InstanceId, State: State.Name}' --output table
          ;;

s3) # List S3 buckets
          log "Listing S3 Buckets in $aws_region"
          aws s3api list-buckets --query "Buckets[*].Name" --output table
          ;;

iam) # List IAM users
          log "Listing IAM Users"
          aws iam list-users --output table
          ;;

lambda) # List Lambda functions
          log "Listing Lambda Functions"
          aws lambda list-functions --output table
          ;;

*) # Invalid service
          echo "Invalid service. Enter a valid service (ec2, s3, iam, lambda)."
          exit 1
          ;;
esac
