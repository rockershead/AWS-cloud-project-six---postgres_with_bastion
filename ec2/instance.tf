resource "aws_security_group" "bastion_security_group" {

  name = "bastion_sg"

  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   
}


resource "aws_instance" "bastion" {
  ami                         = "ami-0532913178263be11"
  instance_type               = "t3.micro"
  subnet_id                   = var.public_subnet_list[0]
  vpc_security_group_ids      = [aws_security_group.bastion_security_group.id]
  associate_public_ip_address = true
  
  key_name                    = aws_key_pair.deployer_key.key_name

  tags = {
    Name = "BASTION"
  }

 
}