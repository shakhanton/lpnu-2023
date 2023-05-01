module "label" {
  source   = "cloudposse/label/null"
  version  = "0.25.0"
  context  = var.context
  name     = var.name
}

module "label_courses" {
  source   = "cloudposse/label/null"
  version  = "0.25.0"
  context  = var.context
  name     = var.name_courses
}

module "lambda" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "4.13.0"
  function_name = module.label.id
  description = "Get all authors"
  handler = "index.handler"
  runtime = "nodejs12.x"
  source_path = "${path.module}/lambda_src/get_all_authors/index.js"
  
  environment_variables = {
    TABLE_NAME = var.table_author_name
  }

  attach_policy_statements = true
  policy_statements = {
    dynamodb = {
      effect    = "Allow",
      actions   = ["dynamodb:Scan"],
      resources = [var.table_author_arn]
    }
    # s3_read = {
    #   effect    = "Deny",
    #   actions   = ["s3:HeadObject", "s3:GetObject"],
    #   resources = ["arn:aws:s3:::my-bucket/*"]
    # }
  }

  tags = module.label.tags
}

module "lambda_courses" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "4.13.0"
  function_name = module.label_courses.id
  description = "Get all courses"
  handler = "index.handler"
  runtime = "nodejs12.x"
  source_path = "${path.module}/lambda_src/get_all_courses/index.js"
  
  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  create_role = false
  lambda_role = var.lambda_courses_role_arn

#   attach_policy_statements = true
#   policy_statements = {
#     dynamodb = {
#       effect    = "Allow",
#       actions   = ["dynamodb:Scan"],
#       resources = [var.table_courses_arn]
#     }
    # s3_read = {
    #   effect    = "Deny",
    #   actions   = ["s3:HeadObject", "s3:GetObject"],
    #   resources = ["arn:aws:s3:::my-bucket/*"]
    # }
#   }

  tags = module.label_courses.tags
}