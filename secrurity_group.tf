
resource "aws_security_group" "my_security_group" {
  name = "ssh"
  description = "Allow SSH traffic from everywhere"
}

resource "aws_security_group_rule" "ssh_ingress" {
  security_group_id = "${aws_security_group.my_security_group.id}"
  type = "ingress"
  protocol = "tcp"
  from_port = 22
  to_port = 22
  cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_security_group_rule" "http_ingress" {
  security_group_id = "${aws_security_group.my_security_group.id}"
  type = "ingress"
  protocol = "tcp"
  from_port = 80
  to_port = 80
  cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_security_group_rule" "https_ingress" {
  security_group_id = "${aws_security_group.my_security_group.id}"
  type = "ingress"
  protocol = "tcp"
  from_port = 443
  to_port = 443
  cidr_blocks = [ "0.0.0.0/0" ]
}

resource "aws_security_group_rule" "port_forward8080" {
  security_group_id = "${aws_security_group.my_security_group.id}"
  type = "ingress"
  protocol = "tcp"
  from_port = 8080
  to_port = 8080
  cidr_blocks = [ "0.0.0.0/0" ]
}
resource "aws_security_group_rule" "port_forward8081" {
  security_group_id = "${aws_security_group.my_security_group.id}"
  type = "ingress"
  protocol = "tcp"
  from_port = 8081
  to_port = 8081
  cidr_blocks = [ "0.0.0.0/0" ]
}
resource "aws_security_group_rule" "port_forward8082" {
  security_group_id = "${aws_security_group.my_security_group.id}"
  type = "ingress"
  protocol = "tcp"
  from_port = 8082
  to_port = 8082
  cidr_blocks = [ "0.0.0.0/0" ]
}


resource "aws_security_group_rule" "ssh_egress" {
  security_group_id = "${aws_security_group.my_security_group.id}"
  type = "egress"
  protocol = "-1"
  from_port = 0
  to_port = 0
  cidr_blocks = [ "0.0.0.0/0" ]
}