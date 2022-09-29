output "redis_endpoint" {
  value = "${aws_elasticache_cluster.redis.cache_nodes}:${aws_elasticache_cluster.redis.port}"
}