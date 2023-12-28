config {
    module              = false
    force               = false
    disabled_by_default = false
}

plugin "aws" {
    enabled = true
    version = "0.28.0"
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

rule "terraform_comment_syntax" {
  enabled = true      # Disallow // comments in favor of #
}

rule "terraform_deprecated_index" {
  enabled = true      # Disallow legacy dot index syntax
}

rule "terraform_documented_variables" {
  enabled = true      # Disallow variable declarations without description
}

rule "terraform_naming_convention" {
  enabled = true      # Enforces naming conventions for resources, data sources, etc
}

rule "terraform_required_providers" {
  enabled = true      # Require that all providers have version constraints through required_providers
}

rule "terraform_required_version" {
  enabled = true      # Disallow terraform declarations without require_version
}

rule "terraform_standard_module_structure" {
  enabled = true      # Ensure that a module complies with the Terraform Standard Module Structure
}

rule "terraform_typed_variables" {
  enabled = true      # Disallow variable declarations without type
}

rule "terraform_unused_declarations" {
  enabled = true      # Disallow variables, data sources, and locals that are declared but never used
}

rule "terraform_unused_required_providers" {
  enabled = true      # Check that all required_providers are used in the module
}
