resource "tls_private_key" "ssh-gen" {
  algorithm   = "RSA"
  ecdsa_curve = "2048"
}

resource "aws_key_pair" "generated_key" {
  key_name   = "ec2-key"
  public_key = "${tls_private_key.ssh-gen.public_key_openssh}"
}
resource "local_file" "foo" {
    content     = "${tls_private_key.ssh-gen.private_key_pem}"
    filename = "${path.module}/ec2.pem"
}


resource "aws_secretsmanager_secret" "private3" {
  name = "private3"
}

resource "aws_secretsmanager_secret_version" "secrets"{
    
secret_id ="${aws_secretsmanager_secret.private3.id}"
secret_string="${tls_private_key.ssh-gen.private_key_pem}"

}
resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow http inbound traffic"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    description = "Http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http"
  }
}
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
