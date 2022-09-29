output "redis_endpoint" {
  value = "${aws_elasticache_cluster.redis.cache_nodes[0].address}:${aws_elasticache_cluster.redis.cache_nodes[0].port}"
}

output "test" {
  value = [ for node in aws_elasticache_cluster.redis.cache_nodes:
  "${node.address}:${node.port}"
  ]

}