# trigger v2

terraform {
  backend "s3" {
    bucket = ""
    key    = ""
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "eks_state" {
  backend = "s3"

  config = {
    bucket = ""
    key    = ""
    region = "us-east-1"
  }
}

resource "aws_security_group" "sg-documentdb-producao" {
  name        = "SG-pos-tech-diner-documentdb-producao"
  description = "pos-tech-diner-producao-ms-documentdb"
  vpc_id      = data.terraform_remote_state.eks_state.outputs["aws_vpc_main_id"]

  ingress {
    description = "VPC"
    from_port   = 27018
    to_port     = 27018
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    description = "VPC"
    from_port   = 27018
    to_port     = 27018
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
}

resource "aws_docdb_subnet_group" "documentdb-subnet-group" {
  name = "aws_subnet_groups_document_db_producao"
  subnet_ids = [
    data.terraform_remote_state.eks_state.outputs["aws_subnet_private_us_east_1a_id"],
    data.terraform_remote_state.eks_state.outputs["aws_subnet_private_us_east_1b_id"]
  ]

  tags = {
    Name = "My documentdb producao subnet group"
  }
}

resource "aws_docdb_cluster_parameter_group" "service" {
  family = "docdb5.0"
  name   = "tf-documentdb-cluster-producao"

  parameter {
    name  = "tls"
    value = "disabled"
  }
}

resource "aws_docdb_cluster" "service" {
  skip_final_snapshot             = true
  db_subnet_group_name            = aws_docdb_subnet_group.documentdb-subnet-group.name
  cluster_identifier              = "tf-documentdb-cluster-producao"
  engine                          = "docdb"
  master_username                 = "username"
  master_password                 = "password"
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.service.name
  vpc_security_group_ids          = ["${aws_security_group.sg-documentdb-producao.id}"]
  port                            = 27018

}

resource "aws_docdb_cluster_instance" "service" {
  count              = 1
  identifier         = "pos-tech-diner-producao-documentdb"
  cluster_identifier = aws_docdb_cluster.service.id
  instance_class     = "db.t3.medium"
}
