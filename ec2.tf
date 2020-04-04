resource "aws_instance" "ec1" {
  ami           = "ami-0fc61db8544a617ed"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.prod-subnet-public-1.id}"
    key_name ="${aws_key_pair.generated_key.id}"
    security_groups=["${aws_security_group.allow_http.id}"]

}
resource "aws_instance" "ec2" {
  ami           = "ami-0fc61db8544a617ed"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.prod-subnet-public-1.id}"
    key_name ="${aws_key_pair.generated_key.id}"
    security_groups=["${aws_security_group.allow_ssh.id}"]

}
resource "aws_instance" "ec3" {
  ami           = "ami-0fc61db8544a617ed"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.prod-subnet-public-2.id}"
  key_name ="${aws_key_pair.generated_key.id}"
}
resource "aws_instance" "ec4" {
  ami           = "ami-0fc61db8544a617ed"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.prod-subnet-private-1.id}"
    key_name ="${aws_key_pair.generated_key.id}"

}
resource "aws_instance" "ec5" {
  ami           = "ami-0fc61db8544a617ed"
  instance_type = "t2.micro"
  subnet_id     = "${aws_subnet.prod-subnet-private-2.id}"
  key_name ="${aws_key_pair.generated_key.id}"
}