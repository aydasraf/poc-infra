resource "aws_ecr_repository" "main" {
  count                = length(local.repo_names)
  name                 = "${local.repo_names[count.index].name}/${local.repo_names[count.index].team}"
  image_tag_mutability = "MUTABLE"

  tags = merge(
    {
      Name = "${local.prefix}-ecs-cluster"
    },
    local.tags
  )
}

resource "aws_ecr_lifecycle_policy" "main" {
  count = length(local.repo_names)

  repository = aws_ecr_repository.main[count.index].name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "keep last 10 images"
      action = {
        type = "expire"
      }
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 10
      }
    }]
  })
}