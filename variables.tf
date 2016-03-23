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

variable "region" {
  default = "us-west-2"
}


variable "amis" {
  default = {
    us-east-1 = "ami-8fcee4e5"    # US East (N. Virginia)
    us-west-1 = "ami-d1f482b1"    # US West (N. California)
    us-west-2 = "ami-63b25203"    # US West (Oregon)
    eu-west-1 = "ami-e1398992"    # EU (Ireland)
  }
}
