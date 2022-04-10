#!/bin/bash -e

STACK_NAME=DC604AWSSecurityWorkshop
AWS_REGION=us-west-2

DB_PASSWORD_FILE=.dbpassword
if [ ! -f "$DB_PASSWORD_FILE" ]; then
    cat /dev/urandom | LC_ALL=C tr -dc 'A-Za-z0-9' | head -c 32 > $DB_PASSWORD_FILE
fi
DB_PASSWORD=$(cat $DB_PASSWORD_FILE)

aws --region $AWS_REGION cloudformation deploy \
    --stack-name $STACK_NAME \
    --template-file CloudFormation/template.yml \
    --parameter-overrides "pDBPassword=$DB_PASSWORD" \
    --capabilities CAPABILITY_NAMED_IAM \
    --no-fail-on-empty-changeset

# echo "RDS password: $DB_PASSWORD"

# output the ALB URL
echo
echo "Web service URL: "
aws cloudformation --region $AWS_REGION describe-stacks \
    --stack-name $STACK_NAME \
    --query "Stacks[0].Outputs[?OutputKey=='FrontendURL'].OutputValue" --output text
