resource "aws_security_group" "postgres_security_group" {

  name = "${var.vpc_name}_postgres_sg"

  vpc_id = var.vpc_id

   ingress {
    from_port   = var.db_port
    to_port     = var.db_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" 
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier          = "my-aurora-postgres-cluster"
  engine                      = "aurora-postgresql"
  engine_version              = "18.3"
  database_name               = var.db_name
  master_username             = jsondecode(data.aws_secretsmanager_secret_version.db_creds.secret_string)["master_user"]
  master_password             = jsondecode(data.aws_secretsmanager_secret_version.db_creds.secret_string)["master_password"]
  db_subnet_group_name        = var.db_subnet_group_name
  skip_final_snapshot         = true
  availability_zones          = [for subnet in var.private_subnets : subnet.az]
  vpc_security_group_ids      = [aws_security_group.postgres_security_group.id]
}

## 2 means 1 writer and 1 reader
resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = 2
  identifier         = "aurora-pg-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.aurora_cluster.id
  instance_class     = "db.t3.medium"
  engine             = aws_rds_cluster.aurora_cluster.engine
  engine_version     = aws_rds_cluster.aurora_cluster.engine_version
  availability_zone  = element([for subnet in var.private_subnets : subnet.az], count.index)
}

