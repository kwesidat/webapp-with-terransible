resource "aws_security_group" "allow_port22" {
  name        = "allow_port22"
  description = "Allow http inbound traffic"
  vpc_id      = "${aws_vpc.webapp_vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
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
