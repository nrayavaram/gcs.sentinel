
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

resource "google_storage_bucket" "example" {
 project              = "<PROJECT_ID>"
 name                 = "${local.resource_prefix}-<name>-gcsbucket"
 labels               = locals.labels
 default_kms_key_name = google_kms_crypto_key.secret.name
}

