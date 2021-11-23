
provider "google" {
 access_token = var.access_token
 project = "airline1-sabre-wolverine"
}


resource "google_storage_bucket" "GCS" {
  name          = "my-dev-appid-strg-demo-gcsbucket"
  location      = "US"
  force_destroy = true
  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 3
     
    }
    action {
      type = "Delete"
    }

  }

}

resource "google_kms_crypto_key" "secret" {
 name     = "${local.resource_prefix}-<name>-key"
 labels   = locals.labels
 key_ring = var.kms_keyring
 ...
}

data "google_storage_project_service_account" "gcs_account" {
 project = "<PROJECT_ID>"
}

