#!/bin/bash

###############################
#Author : Keshav
#Date : 8 Feb 2024
#
#Version : v1
#
#
#This script will report the AWS resource usage
###############################

# Tracing Items :
# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

# Sets the debugger mode
set -x 

# list S3 buckets
echo 'S3 Buckets : ' > ResourceTracker
aws s3 ls >> ResourceTracker

# list EC2 Instances
echo 'EC2 Instances : '>> ResourceTracker
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> ResourceTracker

# list lambda
echo 'Lambda Functions : '>> ResourceTracker
aws lambda list-functions >> ResourceTracker

# list IAM users
echo 'IAM Users : '>> ResourceTracker
aws  iam list-users >> ResourceTracker
