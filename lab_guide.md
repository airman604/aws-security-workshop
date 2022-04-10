# AWS Security 101 Lab Guide

Before starting the labs, make sure you folllow the workshop pre-requisutes to set-up the
lab environment in your own AWS account.

## Lab 1 - Intro

1. Login into your AWS management console and explore the provisioned resources:
    * Connect to the web service and review the "check progress" (URL is displayed by the deploy script, see the tip below if you didn't save the URL).
    * EC2 instances - identify frontend, backend, and database
    * Load balancers

Tip: if you didn't save the URL, grab the public name of the load balancer (web service uses HTTP, no TLS).

## Lab 2 - Security Groups

Lock down Security Groups:

1. Edit the security group applied to the database EC2 instance to lock it down to only allow backend web service to connect to it. Tip: use backend web service security group as the source for the rule.
2. Edit the security group applied to the backend web service EC2 instance to only allow the frontend web service to connect to it.
3. Edit the security group applied to the frontend web service EC2 instance to only allow the load balancer to
connect to it.

Review the "check progress" page to ensure your configuration is correct - "Database Security Group",
"Frontend Security Group", and "Backend Security Group" should show "OK" status.

## Lab 3 - EC2 Instance Metadata

Disable version 1 of the Instance Metadata Service (IMDSv1) and only allow token-backed metadata requests (i.e. v2) on all EC2 instances (i.e. frontend and backend web services).

Tip: this cannot be done from the AWS Console, use AWS CLI or Cloud Shell.

Reference: <https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-options.html#configuring-IMDS-existing-instances>

## Lab 4 - WAF

1. Add WAF configuration to the load balancer.
2. Make sure to pick the right Region (us-west-2 aka US West (Oregon) by default).
3. Attach to the load balancer that is part of our application.
4. Enable "Core rule set" and "SQL database" managed rules.

## Lab 5 - ALB Access Logs

1. Enable access logging on the load balancer.
2. Make some requests to the web application (i.e. generate some logs).
3. Wait for the log file to appear in S3, download and check contents.

Bonus reference (not part of these labs): querying ALB logs in Athena <https://docs.aws.amazon.com/athena/latest/ug/application-load-balancer-logs.html>

## Lab 6 - GuardDuty

1. Enable GuardDuty on the account.
2. Check what alerts are being raised for the frontend web service. (It will take several minutes for the alerts
   to appear in the GuardDuty console).

## Lab 7 - CloudTrail

Open CloudTrail settings and create a new trail.

## Lab 8 - IAM

In this lab we will limit S3 permissions that are assigned to the frontend web service.

1. Find the Frontend EC2 instance (based on the instance names).
2. Check what IAM role is assigned to the instance.
3. In the IAM role, check attached policies.
4. Open the (inline) FrontEndEC2Policy policy.
5. Review what permissions are part of the policy.
6. Expand S3 and restrict access to only "frontend" S3 bucket (check the bucket name of the "frontend" bucket,
    switch Resources setting to Specific, specify the "frontend" bucket name).
7. Save the policy.

## Lab 9 - ScoutSuite (Optional)

Run ScoutSuite against your AWS account and review the findings.

1. Install ScoutSuite by following insructions at <https://github.com/nccgroup/ScoutSuite/wiki/Setup>:

``` bash
virtualenv -p python3 venv
source venv/bin/activate
pip install scoutsuite
scout --help
```

2. Run ScoutSuite: `scout aws`. Ensure you have appropriate AWS credentials configured.
3. Open the ScoutSuite report and review the findings.

Note: setup instructions above will create a `venv` python virtual environment (so that your OS python is not
"polluted" with ScoutSuite dependencies). To remove ScoutSuite, simply delete teh `venv` directory. To run
ScoutSuite at a later time, execute `source venv/bin/activate`, then run `scout` with appropriate parameters.

## Don't forget to check GuardDuty alerts, if you haven't done so yet...
