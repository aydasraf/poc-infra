module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.1.0"

  identifier = "${local.prefix}-rds"

  # All available versions: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts
  engine               = "postgres"
  engine_version       = "14.1"
  family               = "postgres14" # DB parameter group
  major_engine_version = "14"         # DB option group
  instance_class       = "db.t4g.micro"

  storage_type          = "gp2"
  allocated_storage     = 5
  max_allocated_storage = 10

  # NOTE: Do NOT use 'user' as the value for 'username' as it throws:
  # "Error creating DB Instance: InvalidParameterValue: MasterUsername
  # user cannot be used as it is a reserved word used by the engine"
  db_name                = "url_shortener"
  username               = var.DATABASE_USER
  create_random_password = false
  password               = var.DATABASE_PASSWORD

  port = 5432

  multi_az               = false
  db_subnet_group_name   = data.terraform_remote_state.vpc.outputs.database_subnetgroup_name
  vpc_security_group_ids = [aws_security_group.rds.id]

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]
  create_cloudwatch_log_group     = true

  backup_retention_period = 1
  skip_final_snapshot     = true
  deletion_protection     = false

  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true
  monitoring_interval                   = 60
  monitoring_role_name                  = "${local.prefix}-rds-monitoring-role"
  monitoring_role_use_name_prefix       = true
  monitoring_role_description           = ""

  tags = local.tags
}