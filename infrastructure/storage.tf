resource "google_storage_bucket" "input_bucket" {
  name = "${var.project_id}-input"
  location = var.bucket_location
  storage_class = var.storage_class
}