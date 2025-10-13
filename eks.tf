module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.24.0"

  cluster_name                   = local.name
  cluster_version                = "1.28"
  cluster_endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    default = {
      desired_size   = 2
      max_size       = 3
      min_size       = 1
      instance_types = ["t2.medium"]
    }
  }


  access_entries = {
    admin = {
      principal_arn = data.aws_caller_identity.current.arn

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }
}

# IAM Trust Policy Document (who can assume this role)
data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }
  }
}

# IAM Inline Policy Document (permissions for the role)
data "aws_iam_policy_document" "policy" {
  statement {
    actions = [
      "ec2:Describe*",
      "eks:DescribeCluster"
    ]
    resources = ["*"]
  }
}