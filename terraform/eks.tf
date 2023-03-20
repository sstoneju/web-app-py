resource "aws_instance" "web" {
  ami           = "ami-0e735aba742568824"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}