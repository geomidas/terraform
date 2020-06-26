resource "aws_instance" "ubuntu" {
    ami           = "ami-099926fbf83aa61ed"
    instance_type = "t2.micro"
    key_name      = aws_key_pair.ansible.key_name

    vpc_security_group_ids = [
        aws_security_group.frontend.id
    ]

    tags = {
        Name = "ubuntu"
    }
}

resource "aws_security_group" "ubuntu" {
    name = "ubuntu"
    description = "Allow inbound http, https from my IP and all outbound"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["80.233.53.33/32", "83.71.12.64/32"]
    }
    egress {
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}