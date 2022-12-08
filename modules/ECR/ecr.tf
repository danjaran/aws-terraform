resource "aws_ecr_repository" "anjar_ecr" {
  name                 = var.name_ecr
  image_tag_mutability = var.image_tag_mutability

  image_scanning_configuration {
    scan_on_push = false
  }
}