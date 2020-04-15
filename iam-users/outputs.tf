output "aws_iam_user-credentials" {
  description = "The credentials of a given IAM user"
  value = {
    name                        = var.create-aws_iam_user ? aws_iam_user.this[0].name : null
    encrypted_password          = var.create-aws_iam_user_login_profile ? aws_iam_user_login_profile.this[0].encrypted_password : null
    pgp_key                     = var.pgp_key
    access-key-id               = var.create-aws_iam_access_key ? aws_iam_access_key.this[0].id : null
    encrypted-secret-access-key = var.create-aws_iam_access_key ? aws_iam_access_key.this[0].encrypted_secret : null
  }
}
