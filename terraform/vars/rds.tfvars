# Network Vars
region              = "us-west-2"
vpc_id              = "vpc-0bcc57fea354dce81"
subnet_ids          = ["subnet-084e39bb946da4b95", "subnet-09f37e375dd13cdec", "subnet-0c5619569c9943136"]
multi_az            = false
publicly_accessible = true

# DB Vars
db_engine                   = "mysql"
db_storage_type             = "gp2"
db_username                 = "techiescamp"
db_instance_class           = "db.t2.micro"
db_storage_size             = 20
set_secret_manager_password = true
set_db_password             = false
db_password                 = "rdssecret"

# Security Group Vars
ingress_from_port   = 3306
ingress_to_port     = 3306
ingress_protocol    = "tcp"
ingress_cidr_blocks = ["0.0.0.0/0"]

egress_from_port   = 0
egress_to_port     = 0
egress_protocol    = "-1"
egress_cidr_blocks = ["0.0.0.0/0"]

# Backup vars
backup_retention_period  = 7
delete_automated_backups = true
copy_tags_to_snapshot    = true
skip_final_snapshot      = true
apply_immediately        = true

# Parameter store
parameter_store_secret_name = "/dev/petclinic/rds_endpoint"
type                        = "String"

# Tag Vars
owner       = "trannhat"
environment = "dev"
cost_center = "trannhat"
application = "rds"