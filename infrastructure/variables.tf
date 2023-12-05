variable "bucket_input_name" {
  type = string
  description = "Bucket Input name"
}

variable "bucket_location" {
  type = string
  default = "us-east1"
}

variable "cluster_name" {
  type = string
  default = "BrazilStatistics"
}

variable "cluster_region" {
  type = string
  default = "us-east1"
}

variable "dataset_region" {
    type = string
    default = "us-east1"
}

variable "project_id" {
  type = string
}

variable "storage_class" {
  type = string
}
