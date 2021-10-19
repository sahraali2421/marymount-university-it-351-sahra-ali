resource "aws_instance" "my_instance" {
    ami           = " ami-02e136e904f3da870"
    instance_type = "t2.micro"
    key_name = "newkeypair.pem"
    security_groups = ["${aws_security_group.launch-wizard-19.name}"]

    root_block_device {
        volume_size = 10
    }
    
    
    tags = {
        Name = "project"
    }
}

output "instance_ip"{
    value = aws_instance.my_instance.public_ip
}

resource "aws_security_group" "launch-wizard-19" {    
    name            = "launch-wizard-19" 
    description     = "Allow port 22"
    vpc_id          = "vpc-de79d7a3 " 

    ingress {
        description         = "In bond from 22"
        from_port           = 22
        to_port             = 22
        protocol            = "tcp"
        cidr_blocks        = ["0.0.0.0/0"] 
        ipv6_cidr_blocks   = ["::/0"]
    }
    egress {
        description         = "In bond from 22"
        from_port           = 0
        to_port             = 0
        protocol            = "-1"
        cidr_blocks        = ["0.0.0.0/0"] 
        ipv6_cidr_blocks   = ["::/0"]
    }

    tags = {
        Name = "allow_port_22"
    }               
}