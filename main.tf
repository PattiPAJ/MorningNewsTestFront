resource "aws_amplify_app" "morning_news" {
  name       = "morning_news"
  repository = "https://github.com/optimalorchestrators/frontend" # à remplacer

  # The default build_spec added by the Amplify Console for React.
  build_spec = <<-EOT
    version: 0.1
    frontend:
      phases:
        preBuild:
          commands:
            - npm install
        build:
          commands:
            - npm run build
        dev:
          commands:
            - npm run dev
      artifacts:
        baseDirectory: build
        files:
          - '**/*'
      cache:
        paths:
          - node_modules/**/*
  EOT

  # The default rewrites and redirects added by the Amplify Console.
  custom_rule {
    source = "/api/<*>"
    status = "200"
    target = "http://localhost:3001"
  }

  environment_variables = {
    ENV = "test"
  }
}