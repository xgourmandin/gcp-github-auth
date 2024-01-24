locals {
  ressource_prefix = "${var.prefix != null ? var.prefix : ""}github"

  issuer_uri = "https://token.actions.githubusercontent.com"

  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }

}
