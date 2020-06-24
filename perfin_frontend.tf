resource "aws_key_pair" "ansible" {
    key_name   = "ansible-key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQD1nfeI0p78aipU2EVsyEWyvwEgOvdnKpToPrv/WGSQHQKvWW8YcEPwcee373oqh6Fm+nBgg43QPbCYDMqcivwb8TNB9+IYC3xzG+gBFt8pYVQPZR/+7nhgDol7h4Ds3bGdgxR0AcrjNrKYoMaK7nniKvTRe8ykV2fKCmXsCOE3E4tD37iRNe9fApclMp4EewsWxWB7sArXQWWknOJ8M4xz6JsfKz1aSfHrqMQwdlfmezE+H7We7aBV5zWUaIg/OPtUpnZzegH5WkoI0zuJ+HySMdd60dKi2ysVewtjwPsZ4hWAyVaKEOODLG33epFnH4tlbGHRd7J/Gf9GtZJyXitF+A2FmUrV3nG+G/CmmZozq2K3psz6RGVcmy9TQrbV63DOfzp+wt2N1jUdnL6z6Kp73AE1LTGw6+tYzbJ07bud8TfoeixTB7D6qmXG4m2zaaRI5HID2bT7hnQF98RoKMg/Y7rdyedT8wLGs2JhFjvhGVNSeNlt29nREQ3RIy7kAULEtPgejK48udjWKB1iojgsKacqUxJG2qrd59GGMMJmUBQDxGy36kTV9ttTj+FSFpMVq9ynyjbDVGVj3LRIg4mlkHN1ubmMe8Q5Cxw4R725InMB4wPWJXSQgGXZdvpn78zPx8EfMKNVqM7HrRNrrUjnmPfAp8qQnZavpLPE1I4Rcqfbn7oRzo1Uoa7Y4NYciUAO1dhR8kKQJtkMtC+c26kAYXdGKGejqK1AM2rUiLXzomeBPklmHZz2MmxaGfIR1/uqrZLYzU38RwvdSmgxElAZQ6SkJ5g9JWQYY1xF2bnRMGteZhV9v2PDYcXyrOZkEkC+IuBmPyDAd6kVLSN+AxADPPKVYtwm38QeD5uiLkbAS9MgzYxPlFX8C3NvRmUC+L9HPhCijbC4QyJ+66dVtbJZl93HRbjfT+GvMk99p+zbthaCuUwy95RJnTC7hMffrt2SqdBmNcprUvn10K58IXR3wj45JG+wwOypQblJkFFy0CYaL8528KGmLt1YsOqtIEwqbpY3Mn2uaveMiHbm2jnmLpv1IEZEVUa8nWHPLQOEYrUomk15v1R5nZDCuuL73IUUhWt8RWzA/eoz6FRYzDBAtiBQ/xAXgi2V2LC+A7zu9Vqvkj1rVKx4d4eWutb4tPk8lIIp+/Ee2Yp5RfkwHm1t464lyNK1hdJBPFW3ENUSAz8LZMC/5Ginvlj9SYdTADiK7BK8F2B1zhZBgfwEUv1tCPuKsOWUW68T3HXR3AgNxUhJZPVlpCdtVhwYN9M28TXU7EX5BlLDFWsLsqvx2HUzvVBN+j28EWdpO2U7Bsrvuw8iHR/XtRwIicgnMizot9oMtIFC5NeCBbeDREajG+lH ansible@geomidas.com"

    tags = {
        "Terraform" = "true"
    }
}

resource "aws_default_vpc" "default" {}

# EC2 perfin frontend
resource "aws_instance" "frontend" {
    ami           = "ami-0ab4942aa229e00e8"
    instance_type = "t2.micro"
    key_name      = "ansible-key"

    vpc_security_group_ids = [
        aws_security_group.frontend.id
    ]

    tags = {
        "Terraform" = "true"
    }

    lifecycle {
      create_before_destroy = true
    }
}

# Elastic IP
resource "aws_eip" "frontend" {
    instance = aws_instance.frontend.id
#    vpc      = true

    tags = {
        "Terraform" = "true"
    }
}
