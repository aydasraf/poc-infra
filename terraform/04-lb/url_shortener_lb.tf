resource "aws_lb" "url_shortener" {
  name               = "${local.prefix}-url-shortener-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.global.id]
  subnets            = data.terraform_remote_state.vpc.outputs.public_subnets_ids

  enable_deletion_protection = false
}

resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_lb.url_shortener.id
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_alb_listener" "https" {
  load_balancer_arn = aws_lb.url_shortener.id
  port              = 443
  protocol          = "HTTPS"

  ssl_policy = "ELBSecurityPolicy-2016-08"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      status_code  = "404"
    }
  }
}