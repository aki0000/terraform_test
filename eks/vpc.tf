# VPC resource
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"
  tags                 = merge(local.default_tags, tomap({ "Name" = "${local.base_name}-vpc" }))
}

# Subbet resource
resource "aws_subnet" "subnet" {
  count                   = var.num_subnets
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = element(data.aws_availability_zones.available.names, count.index % var.num_subnets)
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 8, count.index)
  map_public_ip_on_launch = true
  tags                    = merge(local.default_tags, tomap({ "Name" = "${local.base_name}-subnet-${count.index + 1}" }))
}

# Internet GW resouce
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags   = merge(local.default_tags, tomap({ "Name" = "${local.base_name}-igw" }))
}

# Route Table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = merge(local.default_tags, tomap({ "Name" = "${local.base_name}-rt" }))
}

resource "aws_route_table_association" "rta" {
  count          = var.num_subnets
  subnet_id      = element(aws_subnet.subnet.*.id, count.index)
  route_table_id = aws_route_table.rt.id
}