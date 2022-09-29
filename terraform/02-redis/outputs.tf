output "redis_endpoint" {
  value = join(",", [for node in aws_elasticache_cluster.redis.cache_nodes :
    "${node.address}:${node.port}"
  ])
}