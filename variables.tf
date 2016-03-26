variable "repo" {
  description = "The github repo where the wiremock samples can be found.  The repo should have a /samples folder with .json files containing the samples"
}

variable "branch" {
  description = "Used with 'repo' for targeting a specific branch."
  default = "master"
}

variable "aws_secret_key" {
  description = "Your AWS secret key"
}

variable "aws_access_key" {
  description = "Your AWS access key"
}

variable "aws_ssh_key_name" {
  description = "The name of your ssh key pair from AWS  (e.g. 'masterkey')"
}

variable "aws_ssh_key_path" {
  description = "The path to your ssh key pair .pem file (e.g. '/vagrant/masterkey.pem')"
}

variable "instance_size" {
  default = "t2.nano"
}

variable "instance_user" {
  default = "ubuntu"
}

variable "region" {
  default = "us-west-2"
}


variable "amis" {
  default = {
    ap-northeast-1 = "ami-8c8981e2"
    ap-southeast-1 = "ami-8ce823ef"
    eu-central-1 = "ami-c29a7dad"
    eu-west-1 = "ami-279e2454"
    sa-east-1 = "ami-e065e88c"
    us-east-1 = "ami-163d3c7c"
    us-west-1 = "ami-da2e5cba"
    cn-north-1 = "ami-17a76f7a"
    ap-southeast-2 = "ami-644c6c07"
    us-west-2     = "ami-12806972"
  }
}
