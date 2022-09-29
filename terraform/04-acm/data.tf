data "aws_route53_zone" "domian" {
  name         = local.domain_name
  private_zone = false
}