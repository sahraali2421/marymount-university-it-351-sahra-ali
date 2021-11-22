resource "aws_instance" "my_instance" {
    ami           = "ami-02e136e904f3da870"
    instance_type = "t2.micro"
    key_name = "newkeypair.pem"
    #security_groups = ["${aws_security_group.pipelinegroup.name}"]
    root_block_device {
        volume_size = 10
    }
    
    tags = {
        Name = "SahrasFirstInstance",
        Lab7 = "completed"
    }
}

resource "aws_instance" "sonarqube_instance" {
  ami           = "ami-000664695def16a6a"
  instance_type = "t3a.medium"
  key_name = "newkeypair.pem"    # Update before saving
  vpc_security_group_ids = ["sg-00942b2623aa052fa"]   # Update before saving

  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = "SahraSonarqube"   # Update before saving
  }
}


output "instance_ip"{
    value = aws_instance.my_instance.public_ip
}
output "sonarqube_ip"{
    value = aws_instance.sonarqube_instance.public_ip
}

