resource "google_iam_workload_identity_pool" "default" {
  workload_identity_pool_id = "${local.ressource_prefix}-identity-pool"
}

resource "google_iam_workload_identity_pool_provider" "default" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.default.workload_identity_pool_id
  workload_identity_pool_provider_id = "${local.ressource_prefix}-provider"

  attribute_mapping = local.attribute_mapping

  oidc {
    issuer_uri = local.issuer_uri
  }
}
