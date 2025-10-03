resource "aws_instance" "backend_ec2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = var.ec2_instance_type
  key_name      = "my-keypair"

  user_data = <<-EOF
              #!/bin/bash
              docker run -d -p 80:80 ${aws_ecr_repository.backend.repository_url}:latest
              EOF
}

resource "aws_db_instance" "postgres" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "15.2"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = var.db_username
  password             = var.db_password
  publicly_accessible  = true
  skip_final_snapshot  = true
}
