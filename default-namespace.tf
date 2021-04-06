resource "kubernetes_limit_range" "namespace-limits" {
  metadata {
    name      = "default"
    namespace = "default"
  }

  spec {
    limit {
      type = "Container"

      default = {
        cpu    = "500m"
        memory = "512Mi"
      }

      default_request = {
        cpu    = "50m"
        memory = "256Mi"
      }
    }
  }
}

// resource "kubernetes_secret" "default-namespace-newrelic" {
//   metadata {
//     name      = "newrelic-licence-key"
//     namespace = "default"
//   }

//   data = {
//     "licence-key" = data.azurerm_key_vault_secret.newrelic-licence.value
//   }

//   type       = "Opaque"
// }
