resource "aws_iam_group" "group" {
  name = var.name
}

### AWS MANAGED POLICIES - START
data "aws_iam_policy" "AdministratorAccess" {
  arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_policy_attachment" "AdministratorAccess" {
  count      = var.enable-AdministratorAccess ? 1 : 0
  group      = aws_iam_group.group.name
  policy_arn = data.aws_iam_policy.AdministratorAccess.arn
}

data "aws_iam_policy" "AWSCodeBuildDeveloperAccess" {
  arn = "arn:aws:iam::aws:policy/AWSCodeBuildDeveloperAccess"
}

resource "aws_iam_group_policy_attachment" "AWSCodeBuildDeveloperAccess" {
  count      = var.enable-AWSCodeBuildDeveloperAccess ? 1 : 0
  group      = aws_iam_group.group.name
  policy_arn = data.aws_iam_policy.AWSCodeBuildDeveloperAccess.arn
}
### AWS MANAGED POLICIES - END
