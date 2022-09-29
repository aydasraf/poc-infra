resource "aws_elasticache_subnet_group" "redis" {
  name       = "${local.prefix}-redis-subnetgroup"
  subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnets_ids
  tags = merge(
    {
      Name = "${local.prefix}-redis-subnetgroup"
    },
    local.tags
  )
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "${local.prefix}-redis"
  engine               = "redis"
  node_type            = local.node_type[terraform.workspace]
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  subnet_group_name    = aws_elasticache_subnet_group.redis.name
  security_group_ids   = [aws_security_group.redis.id]
  tags = merge(
    {
      Name = "${local.prefix}-redis"
    },
    local.tags
  )
}