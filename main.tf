### ORGANIZATION
# After the AWS docs: "An entity that you create to consolidate your AWS accounts so that you can administer them as a single unit."
module "root" {
  source               = "./organizations"
  enabled_policy_types = ["SERVICE_CONTROL_POLICY"]
}
### ORGANIZATION - END


### GROUPS - START
module "administrators" {
  source                     = "./iam-groups"
  name                       = "administrators"
  enable-AdministratorAccess = true
}

module "developers" {
  source                             = "./iam-groups"
  name                               = "developers"
  enable-AWSCodeBuildDeveloperAccess = true
}
### GROUPS - END


### USERS - START
module "admin_user_1" {
  source        = "./iam-users"
  name          = "admin_user_1"
  groups        = ["administrators"]
  force_destroy = true
  pgp_key       = "keybase:admin_user_1" # SWAP admin_user_1 FOR YOUR KEYBASE USERNAME
}

output "admin_user_1-aws_iam_user-credentials" {
  description = "The user's credentials"
  value       = module.admin_user_1.aws_iam_user-credentials
}
### USERS - END


## ORGANIZATION UNITS - START
module "ou-1" {
  source    = "./organizations-organizational_units"
  name      = "ou-1"
  parent_id = module.root.roots.0.id
}
## ORGANIZATION UNITS - END


### ACCOUNTS - START
locals {
  role_name = "adminAssumeRole"
}

module "account-dev" {
  source    = "./organizations-accounts"
  name      = "account-dev"
  email     = "YOUR_EMAIL+account-dev@YOUR_DOMAIN.TLD" # SWAP YOUR_EMAIL+account-dev@YOUR_DOMAIN.TLD FOR YOUR EMAIL ADDRESS
  parent_id = module.ou-1.id
  role_name = local.role_name # NB you won't be able to change this role name via Terraform once created
}

module "account-prod" {
  source    = "./organizations-accounts"
  name      = "account-prod"
  email     = "YOUR_EMAIL+account-prod@YOUR_DOMAIN.TLD" # SWAP YOUR_EMAIL+account-prod@YOUR_DOMAIN.TLD FOR YOUR EMAIL ADDRESS
  parent_id = module.ou-1.id
  role_name = local.role_name # NB you won't be able to change this role name via Terraform once created
}
# ### ACCOUNTS - END


### SERVICE LEVEL (AND/OR TAG) POLICIES - START
module "lock-down-root-user" {
  source      = "./organizations-policies"
  name        = "lock-down-root-user"
  description = "An SCP blocking the root user from taking any action, either via the console or programmatically"
  content     = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "*",
      "Resource": "*",
      "Effect": "Deny",
      "Condition": {
        "StringLike": {
          "aws:PrincipalArn": [
            "arn:aws:iam::*:root"
          ]
        }
      }
    }
  ]
}
POLICY
  type        = "SERVICE_CONTROL_POLICY"
  target_id   = [module.ou-1.id]
}
### SERVICE LEVEL (AND/OR TAG) POLICIES - END
