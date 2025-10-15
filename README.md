AWS EKS Cluster Automation with Terraform, Jenkins & GitHub

This project automates the complete process of creating an Amazon EKS (Elastic Kubernetes Service) cluster on AWS using Terraform, integrated with Jenkins for CI/CD and GitHub for version control.

The idea was simple — write the infrastructure as code in Terraform, push it to GitHub, and let Jenkins handle everything automatically whenever I trigger a build.

What I Built

Infrastructure: Created a full EKS cluster with managed node groups, VPC, subnets, and IAM roles.

Automation: Configured Jenkins to automatically run Terraform commands (init, validate, plan, apply) whenever the pipeline runs.

Version Control: Managed all Terraform files through GitHub for easy collaboration and history tracking.

CI/CD: Linked Jenkins to GitHub so that the pipeline can pull the latest code and deploy it to AWS in one click.

Workflow:

Wrote all .tf files in VS Code.

Created a GitHub repo and pushed the Terraform project.

Added AWS credentials/secrets securely in Jenkins.

Created a Jenkins pipeline (Groovy) and linked it to my GitHub repo.

Clicked “Build Now” — and Jenkins automatically deployed the entire EKS cluster on AWS.

Tools & Technologies:

Cloud Provider	AWS
Infrastructure as Code	Terraform
Automation & CI/CD	Jenkins
Version Control	GitHub
Editor	VS Code
Scripting Languages	HCL (Terraform), Groovy (Jenkinsfile)

Infrastructure Summary:

VPC: Private, public, and intra subnets with NAT and VPN gateways.

EKS Cluster:

Kubernetes version: 1.28

Managed node group with t2.medium instances

Auto-scaling between 1–3 nodes

Public endpoint access enabled

IAM Roles: Custom roles and policies for EKS management access.

Handling AWS Credentials:

I stored AWS credentials securely inside Jenkins Credentials Manager and used them in the pipeline,
This ensures the pipeline runs safely without hardcoding any sensitive information.

Clean-Up:

To remove the entire setup and avoid extra AWS costs:

terraform destroy -auto-approve

 What I Learned:

How to fully automate infrastructure provisioning using Terraform and Jenkins

How to structure Terraform code into reusable modules

Managing secure credentials and CI/CD integrations

Understanding how AWS EKS interacts with IAM, networking, and compute layers
