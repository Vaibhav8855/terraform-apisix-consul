resource "helm_release" "consul" {
  name       = "consul"
  repository = "https://helm.releases.hashicorp.com"
  chart      = "consul"
  namespace  = "consul"
  create_namespace = true
  values     = [file("${path.module}/helm/consul-values.yaml")]
}

