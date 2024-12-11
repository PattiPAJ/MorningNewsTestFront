terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region     = "eu-west-3"
  access_key = "AKIAQ4J5YMX3IKQ7PA37"
  secret_key = "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"
}

resource "aws_amplify_app" "morningnewstestfront" {
  name        = var.app_name
  repository  = var.repository
  oauth_token = var.token
}
resource "aws_amplify_branch" "amplify_branch" {
  app_id      = aws_amplify_app.morningnewstestfront.id
  branch_name = var.branch_name
}
resource "aws_amplify_domain_association" "domain_association" {
  app_id                = aws_amplify_app.morningnewstestfront.id
  domain_name           = var.branch_name
  wait_for_verification = false

  sub_domain {
    branch_name = aws_amplify_branch.amplify_branch.branch_name
    prefix      = var.branch_name
  }

}

output "amplify_app_id" {
  value = aws_amplify_app.morningnewstestfront.id
}

output "amplify_app_url" {
  value = aws_amplify_domain_association.domain_association.domain_name
}


# resource "aws_amplify_app" "morningnewstestfront" {
#   name       = "morningnewstestfront"
#   repository = "https://gitlab.com/patti.ajavon1/morningnewstestfront.git" # à remplacer

#   # Token de Gitlab
#   access_token = "glpat-YzoxCm86MQp1OmV4YmV6LD95dxTB2LBS82k15Aq8MRA.1706yzrrh"

#   # The default build_spec added by the Amplify Console for Next.js.
#   # build_spec = <<-EOT
#   #   version: 1
#   #   frontend:
#   #     phases:
#   #       preBuild:
#   #         commands:
#   #           - npm ci --cache .npm --prefer-offline
#   #       build:
#   #         commands:
#   #           - npm run build
#   #     artifacts:
#   #       baseDirectory: .next
#   #       files:
#   #         - '**/*'
#   #     cache:
#   #       paths:
#   #         - .next/cache/**/*
#   #         - npm/**/*
#   # EOT

#   # The default rewrites and redirects added by the Amplify Console.
#   # custom_rule {
#   #   source = "/api/<*>"
#   #   status = "404"
#   #   target = "/index.html"
#   # }

#   # environment_variables = {
#   #   ENV = "test"
#   # }
# }
# resource "aws_amplify_branch" "amplify_branch" {
#   app_id      = aws_amplify_app.morningnewstestfront.id
#   branch_name = "main"
# }

# resource "aws_amplify_domain_association" "domain_association" {
#   app_id                = aws_amplify_app.morningnewstestfront.id
#   domain_name           = "morningnewstestfront.com"
#   wait_for_verification = false

#   sub_domain {
#     branch_name = aws_amplify_branch.amplify_branch.branch_name
#     prefix      = "www"
#   }
# }