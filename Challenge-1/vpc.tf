# Creating VPC
resource "aws_vpc" "mywebappvpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "mywebapp VPC"
  }
}