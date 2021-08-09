data "aws_iam_policy" "ssm_core" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# IAM Role
resource "aws_iam_role" "instance" {
  name               = "instance"
  path               = "/"
  assume_role_policy = file("policy.json")
}

resource "aws_iam_role_policy" "instance_ssm" {
  name   = "instance_ssm"
  role   = aws_iam_role.instance.id
  policy = data.aws_iam_policy.ec2_ssm.policy
}

resource "aws_iam_instance_profile" "instance" {
  name = "instance"
  role = aws_iam_role.instance.name
}