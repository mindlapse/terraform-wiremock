variable "repo" {}            // The github repo where the wiremock samples can be found.
                              // The repo should have a /samples folder with .json files containing
                              // the samples

variable "secret_key" { }     // Your AWS secret key
variable "access_key" { }     // Your AWS access key
variable "ssh_key_name" { }   // The name of your ssh key pair from AWS  (e.g. 'masterkey')
variable "ssh_key_path" { }   // The path to your ssh key pair .pem file (e.g. '/vagrant/masterkey.pem')

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
