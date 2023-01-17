# Creating Internet Gateway 

resource "aws_internet_gateway" "mywebappgateway" {
  vpc_id = aws_vpc.mywebappvpc.id
}