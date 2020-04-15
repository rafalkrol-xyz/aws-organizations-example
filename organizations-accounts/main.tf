resource "aws_organizations_account" "account" {
  name      = var.name
  email     = var.email
  parent_id = var.parent_id
  role_name = var.role_name

  # There is no AWS Organizations API for reading role_name
  lifecycle {
    ignore_changes = [role_name]
  }
}
