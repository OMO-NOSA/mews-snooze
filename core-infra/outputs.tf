output "cluster_id" {
    value = aws_ecs_cluster.api.id
    description = "Cluster ID for the hello instances"
}
output "cluster_name" {
    value = aws_ecs_cluster.api.name
    description = "Name of the hello Cluster"
}
output "api_alb_id" {
    value = aws_lb.api_cluster.id
    description = "ID of the hello ALB"
}

output "service_url" {
    value = "${aws_lb.api_cluster.dns_name}:${var.service_port}"
    description = "service_url"
}