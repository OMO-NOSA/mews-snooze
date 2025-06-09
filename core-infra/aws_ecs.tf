resource "aws_ecs_cluster" "api" {
  name = "${var.cluster_name}_${random_string.uid.result}"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  configuration {
      execute_command_configuration {
      logging    = "OVERRIDE"
      log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.ecs.name
      }
    }
  }

  tags = {
      Name                = "Factorial Api"
      TerraformWorkspace  = terraform.workspace
      TerraformModule     = basename(abspath(path.module))
      TerraformRootModule = basename(abspath(path.root))
    }
}

resource "aws_ecs_service" "api" {
  name            = "${var.service_name}_ecs_service_${random_string.uid.result}"
  cluster         = aws_ecs_cluster.api.id
  task_definition = aws_ecs_task_definition.api.arn
  desired_count   = var.ecs_service_desired_count
  launch_type     = var.ecs_launch_type


  load_balancer {
    target_group_arn    = aws_lb_target_group.api.arn
    container_name      = var.service_name
    container_port      = var.service_port
  }

  network_configuration {
    assign_public_ip = true
    subnets          = tolist(data.aws_subnet_ids.default.ids)
    security_groups  = [aws_security_group.ecs_scg.id]
  }

}

resource "aws_ecs_task_definition" "api" {
  family                   = var.service_name
  container_definitions    = data.template_file.api.rendered
  requires_compatibilities = [var.ecs_launch_type]

  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  network_mode             = "awsvpc"

  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_execution_role.arn
}


data "template_file" "api" {
  template = "${file("${path.module}/container-definitions/api.json.tpl")}"  
    vars = {
      service_name      = var.service_name
      service_image_url = var.service_image_url
      service_port      = var.service_port
      aws_region        = var.aws_region
      
  }
}