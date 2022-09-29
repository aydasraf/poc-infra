resource "aws_security_group" "global" {
  name        = "${local.prefix}-alb-global-sg"
  description = "Allow HTTP/HTTPS traffic to ALB"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "HTTP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPs"
    from_port   = 443
    to_port     = 443
    protocol    = "HTTPS"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge(
    {
      Name = "${local.prefix}-alb-global-sg"
    },
    local.tags
  )
}