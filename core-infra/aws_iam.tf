data "aws_iam_policy_document" "ec2_app_agent" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "app_execution_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_execution_role" {
  name               = "ecs_app_execution_role-${random_string.uid.result}"
  assume_role_policy = data.aws_iam_policy_document.app_execution_role_policy.json
}

resource "aws_iam_role" "ec2_app_agent" {
  name               = "ec2_app_agent-${random_string.uid.result}"
  assume_role_policy = data.aws_iam_policy_document.ec2_app_agent.json
}

resource "aws_iam_role_policy_attachment" "ec2_app_agent" {
  role       = aws_iam_role.ec2_app_agent.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role_policy_attachment" "ecs_execution_role" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
resource "aws_iam_instance_profile" "ec2_app_agent" {
  name = "ecs-app-agent-${random_string.uid.result}"
  path = "/"
  role = aws_iam_role.ec2_app_agent.name
}