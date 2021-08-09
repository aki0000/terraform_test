# Session Manager
# 必要なendpoint: ssm, ssm messages, ec2messages, s3

resource "aws_security_group" "endpoint" {
  name   = "endpoint"
  vpc_id = aws_vpc.ec2_vpc.id
}

resource "aws_security_group_rule" "endpoint_ingress_https" {
  security_group_id = aws_security_group.endpoint.id
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 443
  protocol          = "tcp"
}

# ssm endpoint
resource "aws_vpc_endpoint" "ssm" {
  vpc_id            = aws_vpc.ec2_vpc.id
  service_name      = "com.amazonaws.us-east-1.ssm"
  vpc_endpoint_type = "Interface"

  security_group_ids  = [aws_security_group.endpoint.id]
  subnet_ids          = [aws_subnet.ec2_subnet.id]
  private_dns_enabled = true
}

# ssmmessages endpoint
resource "aws_vpc_endpoint" "ssmmessages" {
  vpc_id            = aws_vpc.ec2_vpc.id
  service_name      = "com.amazonaws.us-east-1.ssmmessages"
  vpc_endpoint_type = "Interface"

  security_group_ids  = [aws_security_group.endpoint.id]
  subnet_ids          = [aws_subnet.ec2_subnet.id]
  private_dns_enabled = true
}

# ec2messages endpoint
resource "aws_vpc_endpoint" "ec2meesages" {
  vpc_id            = aws_vpc.ec2_vpc.id
  service_name      = "com.amazonaws.us-east-1.ec2messages"
  vpc_endpoint_type = "Interface"

  security_group_ids  = [aws_security_group.endpoint.id]
  subnet_ids          = [aws_subnet.ec2_subnet.id]
  private_dns_enabled = true
}

# S3 endpoint
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.ec2_vpc.id
  service_name = "com.amazonaws.us-east-1.s3"
}
