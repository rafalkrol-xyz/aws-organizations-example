resource "aws_iam_user" "this" {
  count = var.create-aws_iam_user ? 1 : 0

  name = var.name
  path = var.path
}

resource "aws_iam_user_login_profile" "this" {
  count = var.create-aws_iam_user && var.create-aws_iam_user_login_profile ? 1 : 0

  user                    = aws_iam_user.this[count.index].name
  pgp_key                 = var.pgp_key
  password_reset_required = var.password_reset_required
}

resource "aws_iam_access_key" "this" {
  count = var.create-aws_iam_user && var.create-aws_iam_access_key ? 1 : 0

  user    = aws_iam_user.this[count.index].name
  pgp_key = var.pgp_key
}

resource "aws_iam_user_group_membership" "this" {
  count = var.create-aws_iam_user && var.create-aws_iam_user_group_membership ? 1 : 0

  user   = aws_iam_user.this[count.index].name
  groups = var.groups
}
