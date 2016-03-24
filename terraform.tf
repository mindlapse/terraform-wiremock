provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
}

resource "aws_instance" "wiremock" {
  ami             = "${lookup(var.amis, var.region)}"
  instance_type   = "${var.instance_size}"
  security_groups = ["ssh_group", "web_group"]
  key_name        = "${var.aws_ssh_key_name}"

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook ./ansible/playbook.yml --private-key=${var.aws_ssh_key_path} --extra-vars 'git_repo=${repo} git_branch=${branch}' -i ${aws_instance.wiremock.public_ip}, -u ${var.instance_user} -vvvv"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.wiremock.id}"
}
