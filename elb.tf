# Create a new load balancer
resource "aws_elb" "webapp-elb" {
  name               = "webapp-elb"
  #availability_zones = ["${var.azs}"]
  #subnets = ["${aws_subnet.public.*.id}"]
  vpc_id      = "${aws_vpc.webapp_vpc.id}"
  security_groups = ["${aws_security_group.allow_port.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = ["$aws_instance.webapp_instance[count.index]"]
  cross_zone_load_balancing   = true
  idle_timeout                = 100
  connection_draining         = true
  connection_draining_timeout = 300

  tags = {
    Name = "webapp-elb"
  }
}

output "elb-dns-name" {
  value = "${aws_elb.webapp-elb.dns_name}"
}
