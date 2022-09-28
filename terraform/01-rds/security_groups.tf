resource "aws_security_group" "rds" {
  name        = "${local.prefix}-rds-sg"
  description = "Allow inbound traffic to RDS"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description = "Postgres from APP"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.vpc.outputs.private_subnets]
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
      Name = "${local.prefix}-rds-sg"
    },
    local.tags
  )
}