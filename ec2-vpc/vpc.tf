# VPC
resource "aws_vpc" "ec2_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "ec2_vpc"
  }
}

# Subnet
resource "aws_subnet" "ec2_subnet" {
  vpc_id                  = aws_vpc.ec2_vpc.id
  cidr_block              = "10.0.10.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "ec2_subnet"
  }
}

