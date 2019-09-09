# elb

resource "aws_alb" "this" {
  count = var.base_domain != "" ? 1 : 0

  name = var.name

  subnets = var.public_subnet_ids

  security_groups = [
    aws_security_group.this.id
  ]

  tags = {
    Name = var.name
  }
}

resource "aws_alb_target_group" "http" {
  count = var.base_domain != "" ? 1 : 0

  name     = "${var.name}-http"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  tags = {
    Name = "${var.name}-http"
  }
}

resource "aws_alb_target_group_attachment" "http" {
  count = var.base_domain != "" ? 1 : 0

  target_group_arn = aws_alb_target_group.http[0].arn
  target_id        = aws_instance.this.id
  port             = 80
}

resource "aws_alb_listener" "http" {
  count = var.base_domain != "" ? 1 : 0

  load_balancer_arn = aws_alb.this[0].id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.http[0].id
    type             = "forward"
  }
}

resource "aws_alb_listener" "https" {
  count = var.base_domain != "" ? 1 : 0

  load_balancer_arn = aws_alb.this[0].id
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.cert[0].arn

  default_action {
    target_group_arn = aws_alb_target_group.http[0].id
    type             = "forward"
  }
}
