#resource "aws_instance" "ubuntu" {
#    ami           = "ami-099926fbf83aa61ed"
#    instance_type = "t2.micro"
#    key_name      = aws_key_pair.ansible.key_name
#
#    tags = {
#        Name = "ubuntu"
#        "Terraform" = "true"
#    }
#}
