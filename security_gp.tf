resource "aws_security_group" "allow_port" {
  name        = "allow_port22"
  description = "Allow inbound traffic used in Terraform"
  vpc_id      = "${aws_vpc.webapp_vpc.id}"

  ingress {
    from_port   = 443
    to_port     = 442
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
