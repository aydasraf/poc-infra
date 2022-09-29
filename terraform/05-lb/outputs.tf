output "url_shortener_lb_arn" {
  value = aws_lb.url_shortener.arn
}

output "url_shortener_lb_name" {
  value = aws_lb.url_shortener.dns_name
}

output "url_shortener_http_listener_arn" {
  value = aws_alb_listener.http.arn
}

output "url_shortener_https_listener_arn" {
  value = aws_alb_listener.https.arn
}

output "url_shortener_lb_zone_id" {
  value = aws_lb.url_shortener.zone_id
}