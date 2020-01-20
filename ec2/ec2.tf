resource "aws_instance" "application" {
  ami                           = "${var.ami}"
  availability_zone             = "${var.availability_zone}"
  ebs_optimized                 = "${var.ebs_optimized}"
  instance_type                 = "${var.instance_type}"
  key_name                      = "${var.key_name}"
  monitoring                    = "${var.monitoring}"
  vpc_security_group_ids        = ["${var.security_group_ids}"]
  subnet_id                     = "${var.subnet_id}"
  associate_public_ip_address   = "${var.associate_public_ip_address}"
  iam_instance_profile          = "${var.iam_instance_profile}"
  user_data                     = "${var.user_data}"
  tags                          = "${merge(var.tags, map("Name", format("%s", var.instance_name)))}"

#  provisioner "file" {
#    content                     = "${var.user_data_source}"
#    destination                 = "/home/ubuntu/user_data.sh"
#
#    connection {
#      type                      = "ssh"
#      user                      = "ubuntu"
#      private_key               = "${file("${path.module}/../dev/devops.pem")}"
#    }
#  }
#  provisioner "remote-exec" {
#    inline                      = [
#      "chmod +x /home/ubuntu/user_data.sh"
#    ]
#
#    connection {
#      type                      = "ssh"
#      user                      = "ubuntu"
#      private_key               = "${file("${path.module}/../dev/devops.pem")}"
#    }
#  }
}