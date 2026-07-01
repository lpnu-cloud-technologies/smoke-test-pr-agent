module "lambda_get_all_courses" {
  source        = "./modules/lambda"
  function_name = "get-all-courses"
  handler       = "index.handler"
  runtime       = "nodejs24.x"
  source_path   = "${path.module}/../lambdas/get-all-courses"
  environment_variables = {
    TABLE_NAME = module.courses_table.table_name
    AWS_REGION = var.region
  }
}
