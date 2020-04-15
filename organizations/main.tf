resource "aws_organizations_organization" "org" {
  feature_set                   = var.feature_set
  aws_service_access_principals = var.feature_set == "ALL" ? var.aws_service_access_principals : null
  enabled_policy_types          = var.feature_set == "ALL" ? var.enabled_policy_types : null
}
