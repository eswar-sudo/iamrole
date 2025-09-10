provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_role" "this" {
  name = var.name
  assume_role_policy = jsonencode(var.assume_role_policy)
}

# Attach AWS managed policies (optional)
#resource "aws_iam_role_policy_attachment" "this" {
 # for_each   = toset(var.managed_policy_arns)
 # role       = aws_iam_role.this.name
 # policy_arn = each.value
#}
resource "aws_iam_role_policy_attachment" "this" {
  count      = length(var.managed_policy_arns)
  role       = aws_iam_role.this.name
  policy_arn = var.managed_policy_arns[count.index]
}

