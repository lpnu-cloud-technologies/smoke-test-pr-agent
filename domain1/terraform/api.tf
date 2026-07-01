resource "aws_api_gateway_rest_api" "main" {
  name = "courses-api"
}

resource "aws_api_gateway_deployment" "main" {
  rest_api_id = aws_api_gateway_rest_api.main.id
  stage_name  = "dev"
}
