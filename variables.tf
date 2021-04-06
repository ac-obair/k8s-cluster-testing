variable "aks-cluster-env" {
  type        = string
  default     = "dev"
  description = "Environment suffix for the cluster, ie dev|stg|prd"
}

variable "aks-cluster-id" {
  type        = string
  default     = "1"
  description = "ID number for the cluster, ie 'aks-cluster-N'"
}

variable "ingress-load-balancer-ip" {
  type        = string
  default     = "10.122.7.253"
  description = "IP to attach to the ingress controller"
}

variable "ingress-url" {
  type        = string
  default     = "dev.app.arnoldclark.com"
  description = "URL for the ingress controller"
}

variable "ingress-nginx-version" {
  type        = string
  default     = "0.33.0"
  description = "The version of the Nginx Ingress Controller to deploy. Release info available here: https://github.com/kubernetes/ingress-nginx/releases"
}

variable "default-http-backend-version" {
  type        = string
  default     = "1.4"
  description = "The version of the Default HTTP Backend to deploy. Release info available here: https://console.cloud.google.com/gcr/images/google-containers/GLOBAL/defaultbackend?gcrImageListsize=30"
}

variable "kured-version" {
  type        = string
  default     = "1.3.0"
  description = "The version of Kured to deploy. Release info available here: https://github.com/weaveworks/kured/releases"
}

variable "newrelic-infra-version" {
  type        = string
  default     = "1.26.8"
  description = "The version of the NewRelic Infrastructure Integration to deploy. Release info available here: https://docs.newrelic.com/docs/release-notes/platform-release-notes/host-integrations-release-notes"
}

variable "newrelic-events-version" {
  type        = string
  default     = "1.3.0"
  description = "The version of the NewRelic Events Integration to deploy. Release info available here: https://docs.newrelic.com/docs/release-notes/platform-release-notes/kubernetes-integration-release-notes"
}

variable "newrelic-events-forwarder-version" {
  type        = string
  default     = "1.12.0"
  description = "The version of the NewRelic Events Forwarder to deploy. Release info available here: https://docs.newrelic.com/docs/release-notes/platform-release-notes/kubernetes-integration-release-notes"
}

variable "kube-state-metrics-version" {
  type        = string
  default     = "1.9.7"
  description = "The version of kube-state-metrics to deploy, used by the New Relic Integration. Release info: https://github.com/kubernetes/kube-state-metrics/releases"
}

variable "filebeat-version" {
  type        = string
  default     = "7.8.1"
  description = "The version of Filebeat to deploy."
}

variable "filebeat-elasticsearch-url" {
  type        = string
  default     = "search-kubernetes-dev-vh77ut5qlyglhprkcwp4qak47q.eu-west-2.es.amazonaws.com"
  description = "The elasticsearch URL to send logs to"
}

variable "cert-manager-version" {
  type        = string
  default     = "0.15.2"
  description = "The version of cert-manager to deploy. Release info: https://github.com/jetstack/cert-manager/releases"
}
