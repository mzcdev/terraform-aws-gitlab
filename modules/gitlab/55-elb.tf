# elb

resource "aws_elb" "this" {
  count = var.base_domain != "" ? 1 : 0

  name = var.name

  subnets = var.public_subnet_ids

  instances = [
    aws_instance.this.id
  ]

  security_groups = [
    aws_security_group.this.id
  ]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = aws_acm_certificate.cert[0].arn
  }

  listener {
    instance_port     = 22
    instance_protocol = "tcp"
    lb_port           = 22
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/users/confirmation/new"
    interval            = 10
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = var.name
  }
}
