# assume role policy document
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
# role 
resource "aws_iam_role" "role" {
  name = "test_role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# s3 access
data aws_iam_policy_document "s3_read_access" {
  statement {
    effect = "Allow"
    actions = ["s3:Get*", "s3:List*"]

    resources = ["arn:aws:s3:::*"]
  }
}
resource "aws_iam_policy" "policy" {
  name = "test-policy"
  description = "test_policy"
  policy = data.aws_iam_policy_document.s3_read_access.json
}


resource "aws_iam_instance_profile" "spaceone_ec2_profile" {
    name = "test_profile"
    role = aws_iam_role.role.name
}

