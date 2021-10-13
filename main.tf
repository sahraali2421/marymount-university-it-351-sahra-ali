resource "aws_instance" "my_instance" {
    ami           = "ami-087c17d1fe0178315"
    instance_type = "t2.micro"
    key_name = "pipeline-runner"
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
    discription     = "Allow port 22"
    vpc_id          = "vpc-de79d7a3" 

    ingress {
        description         = "In bond from 22"
        from_port           = 22
        2_port              = 22
        protocol            = "tcp"
        sider_bolcks        = ["0.0.0.0_0"] 
        ipv6_sider_blocks   = ["2'/0]
    }
    egress{
        description         = "In bond from 22"
        from_port           = 0
        2_port              = 0
        protocol            = "- 1"
        sider_bolcks        = ["0.0.0.0_0"] 
        ipv6_sider_blocks   = ["2:/0]
    }

    tags {
        Name="allow_port_22"
    }               
}