# Instance用セキュリティグループ
resource "aws_security_group" "instance" {
  name   = "instance"
  vpc_id = aws_vpc.ec2_vpc.id
}

# EC2 Instanceから外部への通信ルール
resource "aws_security_group_rule" "app_server_egress_all" {
  security_group_id = aws_security_group.instance.id
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  protocol          = "all"
}

# EC2 Instance
resource "aws_instance" "app_server" {
  ami                    = "ami-0c2b8ca1dad447f8a"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.ec2_subnet.id
  iam_instance_profile   = aws_iam_instance_profile.instance.name
  vpc_security_group_ids = [aws_security_group.instance.id]

  tags = {
    Name = "EC2Test"
  }
}