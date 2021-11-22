
provider "google" {
 access_token = var.access_token
 project = "airline1-sabre-wolverine"
}


resource "google_storage_bucket" "GCS" {
  name          = "my-bucket"
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
