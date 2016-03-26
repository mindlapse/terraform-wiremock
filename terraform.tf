provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
}

resource "aws_instance" "wiremock" {
  ami             = "${lookup(var.amis, var.region)}"
  instance_type   = "${var.instance_size}"
  security_groups = ["${aws_security_group.ssh_group.name}", "${aws_security_group.web_group.name}"]
  key_name        = "${var.aws_ssh_key_name}"

}

resource "aws_eip" "ip" {
  instance = "${aws_instance.wiremock.id}"

  connection {
    host = "${aws_eip.ip.public_ip}"
    user = "${var.instance_user}"
    private_key = "${file("${var.aws_ssh_key_path}")}"
  }

  provisioner "local-exec" {
    # The sleep is to wait for sshd to come online before attempting to provision (there must be a better way)
    command = "echo 'Sleeping for 180 seconds... (the EC2 instance needs some time to get ready after waking up)' && sleep 180 && ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook ${path.module}/ansible/playbook.yml --private-key=${var.aws_ssh_key_path} --extra-vars 'git_repo=${var.repo} git_branch=${var.branch}' -i ${aws_eip.ip.public_ip}, -u ${var.instance_user} -vvvv"
  }
}
