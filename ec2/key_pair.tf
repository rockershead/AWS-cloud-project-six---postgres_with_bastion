# 1. Generate a secure private key using the TLS provider
resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# 2. Register the public key with AWS to create the EC2 key pair
resource "aws_key_pair" "deployer_key" {
  key_name   = "ec2-bastion-key"
  public_key = tls_private_key.rsa_key.public_key_openssh
}

# 3. Save the private key locally so you can use it to log in
resource "local_file" "private_key" {
  content  = tls_private_key.rsa_key.private_key_pem
  filename = "${path.module}/ec2-bastion-key.pem"
  file_permission = "0400" # Sets read-only permissions required by SSH
}