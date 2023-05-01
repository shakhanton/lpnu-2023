module "label" {
  source   = "cloudposse/label/null"
  version = "0.25.0"
  context = var.context
  name       = var.name
}

resource "aws_dynamodb_table" "this" {
  name             = module.label.id
  hash_key         = "id"
  billing_mode     = "PAY_PER_REQUEST"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "id"
    type = "S"
  }
}