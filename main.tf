terraform {
  required_providers {
    kubernetes = {
	  source = "hashicorp/kubernetes"
      
      source = "hashicorp/kubernetes"
      version = "2.13.1"
    }
	kubectl = {
      source = "gavinbunney/kubectl"
      version = "1.14.0"
    }
	helm = {
      source = "hashicorp/helm"
      version = "2.6.0"
    }
  }
}

provider "kubectl" {
  # run kubectl cluster-info to get endpoint and port
  host = "https://192.168.1.139:6443/"
  token = "eyJhbGciOiJSUzI1NiIsImtpZCI6IjRJc18yaTVxNnVxSlhCSVJXNGh3VVpFaGZtUTJJVlBQTTQ3aGhlTjlIbncifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImNpY2QiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiY2ljZCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6ImI1OWNkYThkLTgzOTQtNDkxNS1iZTU4LTczYjcxY2QxZDc2NCIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDpkZWZhdWx0OmNpY2QifQ.IeFhbWZUm-494XydbpiXpx7c7z0BsYyxTNuV4_qlWOEGsMrV9PNDTatrknp4YMMO0IbQBdqJXPHQyY7VDDx1olXm5-n1vZF_EVJ2baj0pj3AQzckMv6xnXbO82zIraAjR1e53T65TRCSVuJWCRR3Xkm4Kh-SkTIqblY6whesex4DD3VGh0F0-iDuYG2ed43XEcpPSWvmKRKZKvcJ1mwB3lnCzUAf3j_KyHxAv9HmDhJwNGlvMYSRvQ5EV3dLp9ctnXKqkImbFeFq3Ycl6K35x1OSH6ngeEUmWtcs84C4OBXX4jHtRuIULNHvk2glYqlR7M_mNqmlunqotPMX4rZxCg"
  insecure = "true"
}

provider "kubernetes" {
  # run kubectl cluster-info to get endpoint and port
  host = "https://192.168.1.139:6443/"
  token = "eyJhbGciOiJSUzI1NiIsImtpZCI6IjRJc18yaTVxNnVxSlhCSVJXNGh3VVpFaGZtUTJJVlBQTTQ3aGhlTjlIbncifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImNpY2QiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiY2ljZCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6ImI1OWNkYThkLTgzOTQtNDkxNS1iZTU4LTczYjcxY2QxZDc2NCIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDpkZWZhdWx0OmNpY2QifQ.IeFhbWZUm-494XydbpiXpx7c7z0BsYyxTNuV4_qlWOEGsMrV9PNDTatrknp4YMMO0IbQBdqJXPHQyY7VDDx1olXm5-n1vZF_EVJ2baj0pj3AQzckMv6xnXbO82zIraAjR1e53T65TRCSVuJWCRR3Xkm4Kh-SkTIqblY6whesex4DD3VGh0F0-iDuYG2ed43XEcpPSWvmKRKZKvcJ1mwB3lnCzUAf3j_KyHxAv9HmDhJwNGlvMYSRvQ5EV3dLp9ctnXKqkImbFeFq3Ycl6K35x1OSH6ngeEUmWtcs84C4OBXX4jHtRuIULNHvk2glYqlR7M_mNqmlunqotPMX4rZxCg"
  insecure = "true"
}

resource "kubernetes_namespace" "example" {
  metadata {
    annotations = {
      name = "example-annotation"
    }

    labels = {
      mylabel = "label-value"
    }

    name = "terraform-example-namespace"
  }
}

resource "helm_release" "spring-helm-stg" {
  name       = "spring-helm-stg"
  repository = "https://github.com/rcbandit111/terraform_helm_chart_poc/tree/main/helm/spring-helm-stg"
  chart      = "spring-helm-stg"
}
