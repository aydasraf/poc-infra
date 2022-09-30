resource "aws_secretsmanager_secret" "url_shortener" {
  name = "url_shortener_db_${terraform.workspace}"
}
resource "aws_secretsmanager_secret_version" "url_shortener" {
  secret_id = aws_secretsmanager_secret.url_shortener.id
  secret_string = jsonencode(
    {
      db_user = var.DATABASE_USER
      db_pass = var.DATABASE_PASSWORD
    }
  )
}