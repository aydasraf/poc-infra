output "url_shortener_redis_address" {
  value = join(",", [for node in aws_elasticache_cluster.url_shortener.cache_nodes :
    "${node.address}"
  ])
}