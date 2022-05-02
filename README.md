# AWS Security 101 Workshop

Welcome to the AWS Security 101 workshop.

## Pre-requisites

You will use your own AWS account to provision the lab environment. We provide
the provisioning and de-provisioning scripts to make the process easier, and
to ensure all the resources are deleted once you complete the workship to
minimize any costs. **PLEASE NOTE, YOU ARE RESPONSIBLE FOR ANY AWS CHARGES RELATED
TO YOUR USE OF THE GUIDES AND SCRIPTS IN THIS REPOSITORY.** Having said that, such
charges should be minimal.

### Deployment

To participate in the labs, you need to deploy the lab environment to your AWS account
before the workshop!

1. Create an AWS account, if you don't have one:
    - Go to <https://aws.amazon.com/>, click **Create an AWS Account** and follow the instructions.
    - You will need a credit card.
2. Login into your AWS account, then in the top right corner switch to `us-west-2` region
   (**US West (Oregon)**) and open **Cloud Shell**.
3. Clone this repository and run `deploy.sh`:
```bash
git clone https://github.com/airman604/aws-security-workshop.git
cd aws-security-workshop
./deploy.sh
```

Deployment takes around 5 minutes. Once the deployment is complete take a note of the displayed frontend URL.

### Cleanup

1. Run `./destroy.sh` in the **Cloud Shell** (from the cloned repository folder).
2. Delete any resources that you created manually during the labs:
    - delete WAF configuration
    - delete S3 bucket that was created for ALB logs
    - disable **GuardDuty**
    - delete the **CloudTrail** trail

## Useful Resources

- YouTube
  - Channels
    - [Amazon Web Services](https://www.youtube.com/c/amazonwebservices)
    - [AWS Online Tech Talks](https://www.youtube.com/c/AWSOnlineTechTalks)
    - [AWS Events](https://www.youtube.com/c/AWSEventsChannel)
  - AWS re:Invent and re:Inforce
    - [AWS re:Invent](https://www.youtube.com/results?search_query=re%3Ainvent)
    - [AWS re:Inforce](https://www.youtube.com/results?search_query=re%3Ainforce)
- Getting Started
  - [AWS Getting Started](https://aws.amazon.com/getting-started/)
  - [AWS re:Inforce 2019: The Fundamentals of AWS Cloud Security](https://www.youtube.com/watch?v=-ObImxw1PmI)
  - [AWS Security Fundamentals](https://explore.skillbuilder.aws/learn/course/external/view/elearning/48/aws-security-fundamentals-second-edition)
  - [I published an Internet app, wait—how do I protect it?](https://www.youtube.com/watch?v=GSI64krPJXQ)
  - [The Beginner's Guide to Secure Configurations in AWS](https://learn.cisecurity.org/cloud-benchmarks-guide-aws-form)
  - [CIS Benchmark](https://www.cisecurity.org/benchmark/amazon_web_services)
- GuardDuty
  - [Amazon GuardDuty Docs](https://docs.aws.amazon.com/guardduty/)
  - [Getting Hands on with Amazon GuardDuty](https://hands-on-guardduty.awssecworkshops.com/)
  - [Amazon GuardDuty - Let's Attack My Account](https://www.youtube.com/watch?v=f7RB6k7cP6k)
  - [AWS re:Inforce 2019: Threat Detection on AWS: An Introduction to Amazon GuardDuty](https://www.youtube.com/watch?v=czsuZXQvD8E)
  - [Deep Dive on Amazon GuardDuty](https://www.youtube.com/watch?v=o2YaIsps5LY)
  - [Threat Response Scenarios Using Amazon GuardDuty](https://www.youtube.com/watch?v=LChSrke5U2o)
- IAM
  - [AWS re:Invent 2018: [REPEAT 1] Become an IAM Policy Master in 60 Minutes or Less](https://www.youtube.com/watch?v=YQsK4MtsELU)
  - [Deep Dive with Security: AWS Identity and Access Management (IAM)](https://explore.skillbuilder.aws/learn/course/external/view/elearning/104/deep-dive-with-security-aws-identity-and-access-management-iam)
  - [Interactive demo of Capital One breach (showcases abuse of EC2 instance profiles)](https://application.security/free-application-security-training/server-side-request-forgery-in-capital-one)
- VPC
  - [Amazon VPC Docs](https://docs.aws.amazon.com/vpc/index.html)
  - [Introduction to Amazon Virtual Private Cloud (VPC)](https://explore.skillbuilder.aws/learn/course/external/view/elearning/79/introduction-to-amazon-virtual-private-cloud-vpc)
- [AWS Blogs](https://aws.amazon.com/blogs/aws/)
- [AWS Workshops](https://workshops.aws/)
- [AWS Security Workshops](https://awssecworkshops.com/)
- [AWS Skill Builder](https://explore.skillbuilder.aws/learn)
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)
- Subscriptions and pay services
  - [A Cloud Guru](https://acloudguru.com/)
  - [Pluralsight](https://www.pluralsight.com/)
  - [LinkedIn Learning](https://www.linkedin.com/learning/)
  - [O'Reilly Learning Platform](https://www.oreilly.com/)