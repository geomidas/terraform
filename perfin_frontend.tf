variable "perfin_frontend_ami_id" {}

# EC2 perfin frontend
resource "aws_instance" "frontend" {
    ami           = var.perfin_frontend_ami_id
    instance_type = "i3.large"
    key_name      = aws_key_pair.ansible.key_name

    vpc_security_group_ids = [
        aws_security_group.frontend.id
    ]

    tags = {
        Name = "frontend"
        "Terraform" = "true"
    }
}

# Elastic IP
resource "aws_eip" "frontend" {
    instance = aws_instance.frontend.id

    tags = {
        "Terraform" = "true"
    }
}