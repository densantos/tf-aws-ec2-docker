resource "aws_instance" "ec2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.large"
  key_name = "dsantos-labs"
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
 
network_interface {
    network_interface_id = aws_network_interface.nic.id
    device_index         = 0
}

tags = {Name = "Docker-Server"}

}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical

}