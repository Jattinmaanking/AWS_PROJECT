resource "aws_security_group" "allow_ssh" {

  description = "Allow limited inbound traffic"
  vpc_id      = aws_vpc.main-vpc.id
  name        = "terraform-ec2-private-security-group"

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "Ec2-private-sg"
  }
}
