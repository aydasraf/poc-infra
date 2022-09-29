output "url_shortener_instance_arn" {
  value = module.url_shortener.db_instance_arn
}

output "url_shortener_instance_endpoint" {
  value = module.url_shortener.db_instance_endpoint
}

output "url_shortener_secret" {
  value = aws_secretsmanager_secret.url_shortener.arn
}