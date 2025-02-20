resource "aws_instance" "this" {
    ami           = "ami-09c813fb71547fc4f"
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    instance_type = "t3.micro"
    tags = {
        Name = "terraform-demo"
        Purpose = "terraform-practice"
    }

    provisioner "local-exec" {
       command = "echo ${self.private_ip} > inventory"
      
    }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp" # SSH connection
    cidr_blocks      = ["0.0.0.0/0"] #all ip addresses 
  }



  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1" # all protocals
    cidr_blocks      = ["0.0.0.0/0"] #all ip addresses 
  }


  tags = {
    Name = "allow_tls"
  }
}