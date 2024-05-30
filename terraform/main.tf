provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "py-flask-datadog" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y docker
              sudo yum install -y wget
              sudo service docker start
              sudo usermod -a -G docker ec2-user
              curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
              sudo chmod +x /usr/local/bin/docker-compose
              wget https://github.com/azcaxalcoatl/py-flask-datadog
              EOF

  tags = {
    Name = "py-flask-datadog"
  }
}

resource "aws_security_group" "allow-tcp-5000" {
  name        = "allow-tcp-5000"
  description = "This rule is important to permit communication with the API."

  ingress {
    from_port   = 5000
    to_port     = 5000
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

output "instance_id" {
  value = aws_instance.py-flask-datadog.id
}

output "instance_public_ip" {
  value = aws_instance.py-flask-datadog.public_ip
}