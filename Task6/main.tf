provider "kubernetes" {
    config_context_cluster = "minikube"
}

provider "aws" {
    region = "ap-south-1"
    profile = "bobby"
}

module "kube" {
    source = "./kubernetes"
    
}

module "rds" {
    source = "./rds"
    
}