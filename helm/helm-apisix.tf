provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "apisix" {
  name       = "apisix"
  repository = "https://charts.apiseven.com"
  chart      = "apisix"
  namespace  = "apisix"
  create_namespace = true
  values     = [file("${path.module}/helm/apisix-values.yaml")]
}

