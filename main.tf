
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0.0"
    }
  }
}

provider "aws" {
  profile = "cloud_user"
  region  = "us-east-1"
}

# EC2 Instance
resource "aws_instance" "ec2" {
  ami           = "ami-0e001c9271cf7f3b9"
  instance_type = "t3.medium"
  iam_instance_profile = "${aws_iam_instance_profile.spaceone_ec2_profile.name}"

  security_groups = ["${aws_security_group.my_security_group.name}"]
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = "30"
  }

  user_data = file("install.sh")

}




# S3 BUCKET
resource "aws_s3_bucket" "s3" {
  bucket = "sivu-spaceone"
}
