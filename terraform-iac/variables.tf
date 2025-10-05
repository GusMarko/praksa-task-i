variable "kubeconfig_path" {
  type    = string
  default = "~/.kube/config"
}

variable "environment" {
  type = string
}

variable "namespace" {
  type = string
}
