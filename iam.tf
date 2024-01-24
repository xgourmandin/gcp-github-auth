resource "google_service_account" "default" {
  account_id = "${local.ressource_prefix}-sa"
}

resource "google_service_account_iam_binding" "default" {
  members            = ["principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.default.id}/attribute.repository/${var.github_repository}"]
  role               = "roles/iam.workloadIdentityUser"
  service_account_id = google_service_account.default.name
}
