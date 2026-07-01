resource "aws_iam_role" "lambda_get_all_courses" {
  name = "lambda-get-all-courses-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy" "lambda_get_all_courses" {
  role = aws_iam_role.lambda_get_all_courses.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["dynamodb:Scan"]
      Resource = module.courses_table.table_arn
    }]
  })
}
