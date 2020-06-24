#variable "aws_ami_id" {}

resource "aws_default_vpc" "default" {}

# EC2 perfin frontend
#resource "aws_instance" "frontend" {
#    ami           = var.aws_ami_id
#    instance_type = "t2.micro"
#    key_name      = aws_key_pair.ansible.key_name
#
#    vpc_security_group_ids = [
#        aws_security_group.frontend.id
#    ]
#
#    tags = {
#        Name = "frontend"
#        "Terraform" = "true"
#    }
#
#    lifecycle {
#      create_before_destroy = true
#    }
#}
#
## Elastic IP
#resource "aws_eip" "frontend" {
#    instance = aws_instance.frontend.id
#
#    tags = {
#        "Terraform" = "true"
#    }
#}