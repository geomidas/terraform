#resource "aws_security_group" "allow_tls" {
#    ingress {
#        from_port = 80
#        to_port = 80
#        protocol = "tcp"
#        cidr_blocks = ["80.233.53.33/32"]
#    }
#    egress {
#        from_port = 0
#        to_port   = 0
#        protocol  = "-1"
#    }
#}