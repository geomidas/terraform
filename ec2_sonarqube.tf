resource "aws_instance" "sonarqube" {
    ami           = "ami-0ff610fbffc63eead"
    instance_type = "t2.micro"
    key_name      = aws_key_pair.ansible.key_name

    vpc_security_group_ids = [
        aws_security_group.sonarqube.id
    ]

    tags = {
        Name = "nginx"
    }
}

resource "aws_security_group" "sonarqube" {
    name = "sonarqube"
    description = "Allow inbound http, https from my IP and all outbound"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["80.233.53.33/32"]
    }
    ingress {
        from_port = 22
        to_port = 22
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
resource "aws_eip" "sonarqube" {
    instance = aws_instance.sonarqube.id

    tags = {
        Name = "sonarqube"
    }
}