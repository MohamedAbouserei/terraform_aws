resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  #instance_tenancy = "dedicated"

  tags = {
    Name = "main"
  }
}
resource "aws_subnet" "prod-subnet-public-1" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "us-east-2a"
    tags {
        Name = "prod-subnet-public-1"
    }
}
resource "aws_subnet" "prod-subnet-public-2" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "us-east-2a"
    tags {
        Name = "prod-subnet-public-2"
    }
}
resource "aws_subnet" "prod-subnet-private-1" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.3.0/24"
    availability_zone = "us-east-2c"
    tags {
        Name = "prod-subnet-private-1"
    }
}
resource "aws_subnet" "prod-subnet-private-2" {
    vpc_id = "${aws_vpc.main.id}"
    cidr_block = "10.0.4.0/24"
    availability_zone = "us-east-2c"
    tags {
        Name = "prod-subnet-private-2"
    }
}
resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.prod-subnet-public-1.id}"
  route_table_id = "${aws_route_table.public-r1.id}"
}
resource "aws_route_table_association" "b" {
  subnet_id      = "${aws_subnet.prod-subnet-public-2.id}"
  route_table_id = "${aws_route_table.public-r1.id}"
}
resource "aws_route_table_association" "c" {
  subnet_id      = "${aws_subnet.prod-subnet-private-1.id}"
  route_table_id = "${aws_route_table.private-r1.id}"
}
resource "aws_route_table_association" "d" {
  subnet_id      = "${aws_subnet.prod-subnet-private-2.id}"
  route_table_id = "${aws_route_table.private-r1.id}"
}
