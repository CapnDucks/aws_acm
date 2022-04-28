variable "domain" {
  default = "capnduck.com."
}

locals {
  # Strip any trailing `.` from the name: https://bugzilla.mozilla.org/show_bug.cgi?id=134402
  domain_name = trimsuffix(var.domain, ".")
  use_existing_route53_zone = true
}

module "acm" {
  source = "../"

  domain_name = local.domain_name
  zone_id     = data.aws_route53_zone.this.*.zone_id

  subject_alternative_names = [
    local.domain_name,
    "*.${local.domain_name}",
    "api.${local.domain_name}",
    "*.api.${local.domain_name}",
    "sub.${local.domain_name}",
    "*.sub.${local.domain_name}",
    "alerts.${local.domain_name}",
    "*.alerts.${local.domain_name}",
  ]

  wait_for_validation = true

  tags = {
    Name = local.domain_name
  }
}
