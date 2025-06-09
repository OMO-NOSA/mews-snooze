module "api" {
  source       = "../../core-infra"
  vpc_id       = data.aws_vpc.default.id
  subnet_ids   = tolist(data.aws_subnet_ids.default.ids)
  aws_region   = "us-east-1"
  cluster_name = "staging-app"
  environment  = "staging"
}