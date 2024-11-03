terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket         = "terraform-backend-terraformbackends3bucket-17p78gkeyito"
    key            = "pipeline"
    region         = "ap-south-1"
    dynamodb_table = "terraform-backend-TerraformBackendDynamoDBTable-CTQNIAYWXFKI"
  }
}

provider "aws" {
  default_tags {
    tags = {
      "Environment" = "Test"
      "Project"     = "Terraform"
      "Operation"   = "Nokia"
    }
  }
}
