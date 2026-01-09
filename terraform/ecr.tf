resource "aws_ecr_repository" "app" {
  name = "${var.project_name}-repo"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"
}