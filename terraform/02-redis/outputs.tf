output "url_shortener_redis_address" {
  value = join(",", [for node in aws_elasticache_cluster.redis.cache_nodes :
    "${node.address}"
  ])
}