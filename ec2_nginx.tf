resource "aws_instance" "ubuntu" {
    ami           = "ami-0aec5ec60fa54729c"
    instance_type = "m3.medium"
    key_name      = aws_key_pair.ansible.key_name

    vpc_security_group_ids = [
        aws_security_group.nginx.id
    ]

    tags = {
        Name = "nginx"
    }
}

resource "aws_security_group" "nginx" {
    name = "nginx"
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
}

# Elastic IP
resource "aws_eip" "nginx" {
    instance = aws_instance.nginx.id
}