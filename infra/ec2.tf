resource "aws_instance" "backend_ec2" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.backend_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install -y nodejs npm git
              cd /home/ubuntu
              git clone https://github.com/srinivassuddala10/app-api.git app
              cd app
              npm install
              npm install pm2 -g
              pm2 start index.js --name backend-api
              pm2 startup
              EOF
}
