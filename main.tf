resource "aws_instance" "my_instance" {
    ami           = "ami-087c17d1fe0178315"
    instance_type = "t2.micro"
    key_name = "gitlab-runner"

    root_block_device {
        volume_size = 8
    }

    tags = {
        Name = "SahraFirstTFInstance"
    }
}

output "instance_ip"{
    value = aws_instance.my_instance.public_ip
}