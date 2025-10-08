terraform {

  backend "local" {
            path= "terraform.tfstate"
            workspace_dir= "C:\\Users\\marko.gusic\\git\\terraform.tfstate.d"
  } 
  
  required_version = ">= 1.3.0"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.7"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.20"
    }
  }
}

provider "kubernetes" {
  config_path = var.kubeconfig_path
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig_path
  }
}
