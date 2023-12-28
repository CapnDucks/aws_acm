variable "validate_certificate" {
  description = "Whether to validate certificate by creating Route53 record"
  type        = bool
  default     = true
}

variable "validation_allow_overwrite_records" {
  description = "Whether to allow overwrite of Route53 records"
  type        = bool
  default     = true
}

variable "wait_for_validation" {
  description = "Whether to wait for the validation to complete"
  type        = bool
  default     = true
}

variable "certificate_transparency_logging_preference" {
  description = "Specifies whether certificate details should be added to a certificate transparency log"
  type        = bool
  default     = true
}

variable "domain_name" {
  description = "A domain name for which the certificate should be issued"
  type        = string
}

variable "subject_alternative_names" {
  description = "A list of domains that should be SANs in the issued certificate"
  type        = list(string)
  default     = []
}

variable "validation_method" {
  description = "Which method to use for validation. DNS or EMAIL are valid, NONE can be used for certificates that were imported into ACM and then into Terraform."
  type        = string
  default     = "DNS"

  validation {
    condition     = contains(["DNS", "EMAIL", "NONE"], var.validation_method)
    error_message = "Valid values are DNS, EMAIL or NONE."
  }
}

variable "create_route53_records" {
  description = "When validation is set to DNS, define whether to create the DNS records internally via Route53 or externally using any DNS provider"
  type        = bool
  default     = true
}

variable "validation_record_fqdns" {
  description = "When validation is set to DNS and the DNS validation records are set externally, provide the fqdns for the validation"
  type        = list(string)
  default     = []
}

variable "dns_ttl" {
  description = "The TTL of DNS recursive resolvers to cache information about this record."
  type        = number
  default     = 60
}

variable "tags" {
  default     = null
  description = "Tags for the resource"
  type        = map(string)
}

variable "private_zone" {
  default     = null
  description = "Is the zone private?"
  type        = bool
}

variable "aws_region" {
  default     = "us-east-1"
  description = ""
  type        = string
}
