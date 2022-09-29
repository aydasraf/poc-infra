resource "aws_security_group" "redis" {
  name        = "${local.prefix}-redis-sg"
  description = "Allow inbound traffic to Redis"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description = "Redis from APP"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = data.terraform_remote_state.vpc.outputs.private_subnets_cidrs
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
      Name = "${local.prefix}-redis-sg"
    },
    local.tags
  )
}