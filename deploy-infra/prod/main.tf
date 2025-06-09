module "api" {
  source = "../"
  vpc_id                        = data.aws_vpc.default.id
  subnet_ids                    = tolist(data.aws_subnet_ids.default.ids)
  cluster_name                  = var.cluster_name
  
}