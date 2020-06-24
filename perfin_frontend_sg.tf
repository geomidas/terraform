resource "aws_security_group" "frontend" {
    name = "frontend"
    description = "Allow inbound http, https from my IP and all outbound"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["80.233.53.33/32"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["80.233.53.33/32"]
    }
    egress {
        from_port = 0
        to_port   = 0
        protocol  = "-1"
    }

    tags = {
        "Terraform" = "true"
    }
}