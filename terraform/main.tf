provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "py_flask_datadog" {
  ami           = "ami-00beae93a2d981137"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y docker
              sudo yum install -y git
              sudo service docker start
              sudo usermod -a -G docker ec2-user
              sudo yum install -y libxcrypt-compat
              curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              sudo chmod +x /usr/local/bin/docker-compose
              EOF

  tags = {
    Name = "py_flask_datadog"
  }

  vpc_security_group_ids = [aws_security_group.allow_tcp_ssh.id]

  key_name = aws_key_pair.py_flask_datadog.key_name
}

resource "aws_security_group" "allow_tcp_ssh" {
  name        = "allow_tcp_ssh"
  description = "This rule is important to permit communication with the API and SSH."

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "py_flask_datadog" {
  key_name   = "py_flask_datadog"
  public_key = file("~/.ssh/id_rsa.pub")
}

output "instance_id" {
  value = aws_instance.py_flask_datadog.id
}

output "instance_public_ip" {
  value = aws_instance.py_flask_datadog.public_ip
}