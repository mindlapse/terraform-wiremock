
resource "aws_instance" "wiremock" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "${var.instance_size}"
  security_groups = ["ssh_group", "tls_group"]
  key_name = "${var.ssh_key_name}"
  key_file = "${var.ssh_key_path}"

  provisioner "local-exec" {
    command = "ansible-playbook ${aws_instance.wiremock.public_ip} ./ansible/playbook.yml --extra-vars 'git_repo=${repo} git_branch=${branch}'"
  }
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.wiremock.id}"
}
