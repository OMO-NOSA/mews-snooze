data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

resource "aws_lb" "api_cluster" {
  name               = "${var.lb_name}-${random_string.uid.result}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = tolist(data.aws_subnet_ids.default.ids)

  enable_deletion_protection = false

  tags = {
    Environment = var.environment
  }
}



resource "aws_lb_target_group" "api" {
  name                 = "${var.lb_name}-${random_string.uid.result}"
  port                 = var.service_port
  protocol             = "HTTP"
  vpc_id               = var.vpc_id
  target_type          = "ip"

  tags = {

    Name                = "Factorial API"
    TerraformWorkspace  = terraform.workspace
    TerraformModule     = basename(abspath(path.module))
    TerraformRootModule = basename(abspath(path.root))
  }
  health_check {
    protocol = var.health_check_protocol
    port     = var.service_port
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    aws_lb.api_cluster
  ]

}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.api_cluster.arn
  port              = var.service_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.api.arn
    type             = "forward"
  }
}