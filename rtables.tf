resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "public-r1" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "public-r1"
  }
}

resource "aws_route_table" "private-r1" {
  vpc_id = "${aws_vpc.main.id}"
  
  tags = {
    Name = "private-r1"
  }
}
