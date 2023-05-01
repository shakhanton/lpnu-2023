module "label_table_courses" {
  source   = "cloudposse/label/null"
  version  = "0.25.0"
  context  = var.context
  name     = "${var.name}-table-courses"
}




