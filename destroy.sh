#!/bin/bash -e

STACK_NAME=DC604AWSSecurityWorkshop
AWS_REGION=us-west-2

aws --region $AWS_REGION cloudformation delete-stack --stack-name $STACK_NAME

echo "Waiting for the CloudFormation stack to be deleted..."
aws --region $AWS_REGION cloudformation wait stack-delete-complete \
    --stack-name $STACK_NAME
    