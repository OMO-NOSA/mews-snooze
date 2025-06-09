Terraform module that spawns the Factorial API on an autoscalabling group of ECS Cluster

Features:
* High-availability (Multi-AZ)
* Loadbalanced (ALB)
* Isolated in a VPC
* Auto-scaling

## What is ECS

ECS stands for Elastic Container Service and is the AWS platform for running Docker containers.
The full documentation about ECS can be found [here](https://aws.amazon.com/ecs/), the development guide can be found [here](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html). A more fun read can be found at [The Hitchhiker's Guide to AWS ECS and Docker](http://start.jcolemorrison.com/the-hitchhikers-guide-to-aws-ecs-and-docker/).



## Variables:

### Required Variables

- vpc_id
- subnet_ids

### Optional Variables

- ami_id
- ecs_desired_capacity      -- Defauts to 1, when not set
- ecs_max_size              -- Defauts to 1, when not set
- ecs_min_size              -- Defauts to 1, when not set
- ecs_service_desired_count
- asg_adjustment_type
- scaling_adjustment
- health_check_protocol
- service_port
- service_name



