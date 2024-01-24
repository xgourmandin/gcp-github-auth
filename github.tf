resource "github_actions_variable" "workload_identity_provider" {
  repository    = var.github_repository
  variable_name = "workload_id_provider_id"
  value         = google_iam_workload_identity_pool_provider.default.id
}

resource "github_actions_variable" "sa_email" {
  repository    = var.github_repository
  variable_name = "service_account_email"
  value         = google_service_account.default.email
}
