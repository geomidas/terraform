## EC2 perfin frontend
#resource "aws_instance" "frontend" {
#    ami           = "ami-00b66cbd71b21169f"
#    instance_type = "i3.large"
#    key_name      = aws_key_pair.ansible.key_name
#
#    vpc_security_group_ids = [
#        aws_security_group.frontend.id
#    ]
#
#    tags = {
#        Name = "frontend"
#    }
#}
#
#resource "aws_security_group" "frontend" {
#    name = "frontend"
#    description = "Allow inbound http, https from my IP and all outbound"
#
#    ingress {
#        from_port = 80
#        to_port = 80
#        protocol = "tcp"
#        cidr_blocks = ["80.233.53.33/32", "83.71.12.64/32"]
#    }
#    ingress {
#        from_port = 22
#        to_port = 22
#        protocol = "tcp"
#        cidr_blocks = ["80.233.53.33/32", "83.71.12.64/32"]
#    }
#    egress {
#        from_port = 0
#        to_port   = 0
#        protocol  = "-1"
#    }
#}
#
## Elastic IP
#resource "aws_eip" "frontend" {
#    instance = aws_instance.frontend.id
#
#    tags = {
#        Name = "frontend"
#    }
#}