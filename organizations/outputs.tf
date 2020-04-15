output "roots" {
  description = "After the Terraform docs: 'List of organization roots. (...)'"
  value       = aws_organizations_organization.org.roots
}
