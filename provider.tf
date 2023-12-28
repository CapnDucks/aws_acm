provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      terraform = "true"
      module    = "https://github.com/CapnDucks/aws_acm.git"
    }

  }

}
