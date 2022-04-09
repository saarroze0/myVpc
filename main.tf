terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-1"
}

# Create a VPC
resource "aws_vpc" "saar" {
  cidr_block = "172.153.0.0/16"
  tags = {
    Name = "saar-vpc"
  }
}

# Create webSubnet
resource "aws_subnet" "webSubnet" {
  vpc_id=aws_vpc.saar.id
  cidr_block = "172.153.1.0/27"
  tags={
      Name = "subnet_web"
  }
}

# Create appSubnet
resource "aws_subnet" "appSubnet" {
  vpc_id=aws_vpc.saar.id
  cidr_block = "172.153.1.32/27"
  tags={
      Name = "subnet_App"
  }
}
# Create DBSubnet
resource "aws_subnet" "DBSubnet" {
  vpc_id=aws_vpc.saar.id
  cidr_block = "172.153.1.64/28"
  tags={
      Name = "subnet_DB"
  }
}




