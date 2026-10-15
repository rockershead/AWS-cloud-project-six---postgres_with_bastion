data "aws_secretsmanager_secret" "db_creds" {
  name = "db_creds"
}

data "aws_secretsmanager_secret_version" "db_creds" {
  secret_id = data.aws_secretsmanager_secret.db_creds.id
}