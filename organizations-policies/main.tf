resource "aws_organizations_policy" "policy" {
  name        = var.name
  description = var.description
  content     = var.content
  type        = var.type
}

resource "aws_organizations_policy_attachment" "attachment" {
  count = length(var.target_id)
  
  policy_id = aws_organizations_policy.policy.id
  target_id = var.target_id[count.index]
}
