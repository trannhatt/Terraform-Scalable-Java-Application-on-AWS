#Network
region  = "us-west-2"
vpc_id  = "vpc-0bcc57fea354dce81"
subnets = ["subnet-084e39bb946da4b95", "subnet-09f37e375dd13cdec", "subnet-0c5619569c9943136"]
#alb_sg
ingress_alb_from_port   = 80
ingress_alb_to_port     = 80
ingress_alb_protocol    = "tcp"
ingress_alb_cidr_blocks = ["0.0.0.0/0"]
egress_alb_from_port    = 0
egress_alb_to_port      = 0
egress_alb_protocol     = "-1"
egress_alb_cidr_blocks  = ["0.0.0.0/0"]

#alb
internal          = false
loadbalancer_type = "application"

#target_group
target_group_port                = 8080
target_group_protocol            = "HTTP"
target_type                      = "instance"
load_balancing_algorithm         = "round_robin"
health_check_path                = "/"
health_check_port                = 8080
health_check_protocol            = "HTTP"
health_check_interval            = 30
health_check_timeout             = 5
health_check_healthy_threshold   = 2
health_check_unhealthy_threshold = 2

#instance_sg
ingress_asg_cidr_from_port = 22
ingress_asg_cidr_to_port   = 22
ingress_asg_cidr_protocol  = "tcp"
ingress_asg_cidr_blocks    = ["0.0.0.0/0"]
ingress_asg_sg_from_port   = 8080
ingress_asg_sg_to_port     = 8080
ingress_asg_sg_protocol    = "tcp"
egress_asg_from_port       = 0
egress_asg_to_port         = 0
egress_asg_protocol        = "-1"
egress_asg_cidr_blocks     = ["0.0.0.0/0"]

#asg
max_size         = 3
min_size         = 1
desired_capacity = 2

#listener
listener_port     = 80
listener_protocol = "HTTP"
listener_type     = "forward"

#launch_template
ami_id               = "ami-07653fee7a0ddcfac"
instance_type        = "t2.micro"
key_name             = "asg-llb-java-app"
user_data            = <<-EOF
#!/bin/bash
bash /home/ubuntu/start.sh
EOF
public_access        = true
instance_warmup_time = 30
target_value         = 50

owner       = "trannhat"
environment = "dev"
cost_center = "trannhat"
application = "pet-clinic"
