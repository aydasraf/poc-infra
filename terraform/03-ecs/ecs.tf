resource "aws_ecs_cluster" "ecs" {
  name = "${local.prefix}-ecs-cluster"
  tags = merge(
    {
      Name = "${local.prefix}-ecs-cluster"
    },
    local.tags
  )
}