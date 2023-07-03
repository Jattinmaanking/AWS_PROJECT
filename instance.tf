# resource "aws_instance" "web" {
#   ami           = "ami-053b0d53c279acc90"
#   instance_type = "t2.micro"
#   key_name      = "ec2-pem.pem"
#   //key_name = aws_key_pair.ubuntu-kp. 

#   vpc_security_group_ids      = ["${aws_security_group.allow_ssh.id}"]
#   subnet_id                   = aws_subnet.main-public.id
#   associate_public_ip_address = "true"
#   tags = {
#     Name = "my-public-web-server"
#   }
#   #    provisioner "file" {
#   #     source = "installjenkins.sh"
#   #     destination = "/tmp/installjenkins.sh"

#   #     connection {
#   #       type = "ssh"
#   #       user = "ubuntu"
#   #       private_key = file("${path.module}/ubuntu-kp.pem")
#   #       host = "${aws_instance.web.public_ip}"
#   #     }

#   # }


# }