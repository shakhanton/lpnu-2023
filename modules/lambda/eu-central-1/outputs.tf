output "lambda_courses_invoke_arn" {
    value = module.lambda_courses.lambda_function_invoke_arn
}

output "lambda_authors_invoke_arn" {
    value = module.lambda.lambda_function_invoke_arn
}

output "lambda_authors_function_name" {
    value = module.lambda.lambda_function_name
}