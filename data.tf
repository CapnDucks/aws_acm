data "aws_route53_zone" "this" {
  name         = var.domain_name
  private_zone = var.private_zone
}
