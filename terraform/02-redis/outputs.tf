output "redis_endpoint" {
  value = "${aws_elasticache_cluster.redis.cluster_address}:${aws_elasticache_cluster.redis.port}"
}