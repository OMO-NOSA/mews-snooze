variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-2"
}

variable "http_cidr_block" {
  type = list(string)
  description = "Cidr block for the http traffics"
  default = ["0.0.0.0/0"]
}

variable "service_cidr_block" {
  type = list(string)
  description = "Cidr block for the http traffics"
  default = ["0.0.0.0/0"]
}

variable "application_count" {
  type        = number
  description = "Number of application instance"
  default     = 2
  }

variable "vpc_id" {
  type        = string
  description = "VPC ID in which to deploy ECS Instances"
}

variable "subnet_ids" {
  type        = list(string)
  description = "network subnet ids"
}

variable "project_name" {
    type        = string
    description = "Project name to be rendered in tags"
    default     = "app"
}
variable "environment" {
    type        = string
    description = "Environment to be rendered in tags"
    default     = "dev"
}

variable "health_check_path" {
    type        = string
    description = "The default health check path"
    default     = "/"
}

variable "health_check_protocol" {
    type        = string
    description = "Protocol for the health check"
    default     = "HTTP"
}
variable "lb_name" {
    type        = string
    description = "Name of Application load balancer"
    default     = "app"
}
variable "ecs_desired_capacity" {
  type        = number
  description = "Desired scale capacity for ecs cluster"
  default     = 1
}

variable "ecs_max_size" {
  type        = number
  description = "Auto Scaling group max size"
  default     = 1
}

variable "ecs_min_size" {
  type        = number
  description = "Auto Scaling group min size"
  default     = 1
}

variable "asg_adjustment_type" {
  type        = string
  description = "Auto Scaling group adjustment type -- Valid values are ChangeInCapacity, ExactCapacity, and PercentChangeInCapacity."
  default     = "ChangeInCapacity"  
}

variable "cluster_name" {
    type        = string
    description = "Name of cluster"
    default     = "app-cluster"
}

variable "app_agent_task_name" {
  type        = string
  description = "app agent task name"
  default     = "app agent"
}

variable "app_task_name" {
  type        = string
  description = "app task name"
  default     = "app task"
}

variable "log_retention_in_days" {
  type        = number
  description = "Number of days to retain logs before deletion"
  default     = 7
}

variable "ecs_service_desired_count" {
  type        = number
  description = "Number of desired ecs service instance"
  default     = 3
}

variable "service_name" {
  type        = string
  description = "Name of running container"
  default     = "app"
}
variable "service_port" {
  type        = number
  description = "Port of running container"
  default     = 80
}

variable "scaling_adjustment" {
  type        = number
  description = "Scaling adjustment for autoscaling group"
  default     = 3
}
variable "fargate_cpu" {
  type        = number
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = 256
}
variable "fargate_memory" {
  type        = number
  description = "Fargate instance memory to provision (in MiB)"
  default     = 512
}
variable "ecs_launch_type" {
  type        = string
  description = "Determines the Infrastructure on which tasks and services are hosted"
  default     = "FARGATE"
}
// The docker image url
// This can also be the ECR image URL, when using ECR ensure the ECS have permissions to pull from ECR registry.
variable "service_image_url" {
  type        = string
  description = "Url to the container image(Dockerhub/ECR)"
  default     = "docker.io/omojaphet/app-test:latest"
}