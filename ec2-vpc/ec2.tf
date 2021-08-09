resource "aws_instance" "app_server" {
  ami           = "ami-0747bdcabd34c712a"
  instance_type = "t2.micro"

  tags = {
    Name = "EC2Test"
  }
}