module "ecr" {
  source = "./modules/ecr"
}

module "docker" {
  source = "./modules/docker"
  ecr_repository_url = module.ecr.repository_url
}

module "deployment" {
  source = "./modules/deployment"
  image_uri = module.ecr.image_uri
}




