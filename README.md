# AWS Security 101 Workshop

Welcome to the AWS Security 101 workshop.

## Pre-requisites

You will use your own AWS account to provision the lab environment. We provide
the provisioning and de-provisioning scripts to make the process easier, and
to ensure all the resources are deleted once you complete the workship to
minimize any costs. PLEASE NOTE, YOU ARE RESPONSIBLE FOR ANY AWS CHARGES RELATED
TO YOUR USE OF THE GUIDES AND SCRIPTS IN THIS REPOSITORY. Having said that, such
charges should be minimal.

### Deployment

To participate in the labs, you need to deploy the lab environment to your AWS account
before the workshop!

1. Create an AWS account, if you don't have one:
    * Go to <https://aws.amazon.com/>, click **Create an AWS Account** and follow the instructions.
    * You will need a credit card.
2. Login into your AWS account, then in the top right corner switch to `us-west-2` region
   (**US West (Oregon)**) and open **Cloud Shell**.
3. Clone this repository and run `deploy.sh`:
```bash
git clone https://github.com/airman604/aws-security-workshop.git`
cd aws-security-workshop
./deploy.sh
```

Once the deployment is complete take a note of the displayed frontend URL.

### Cleanup

1. Run `./destroy.sh` in the **Cloud Shell** (from the cloned repository folder).
2. Delete any resources that you created manually during the labs:
    * delete WAF configuration
    * delete S3 bucket that was created for ALB logs
    * disable **GuardDuty**
    * delete the **CloudTrail** trail
