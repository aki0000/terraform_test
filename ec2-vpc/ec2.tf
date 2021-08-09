resource "aws_instance" "app_server" {
  ami           = "ami-0747bdcabd34c712a"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.ec2_subnet.id

  tags = {
    Name = "EC2Test"
  }
}