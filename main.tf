resource "aws_instance" "my_instance" {
    ami           = "ami-087c17d1fe0178315"
    instance_type = "t2.micro"
    key_name = "gitlab-runner"
    security_groups = ["${aws_security_group.Pipelinegroup.name}"]

    root_block_device {
        volume_size = 10
    }
    #Addtionalebs
    
    tags = {
        Name = "Pipelineproject"
    }
}

output "instance_ip"{
    value = aws_instance.my_instance.public_ip
}

resource "aws_security_group" "Pipelinegroup" {    
    name            = "Pipelinegroup" 
    description     = "Allow port 22"
    vpc_id          = "vpc-de79d7a3" 

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