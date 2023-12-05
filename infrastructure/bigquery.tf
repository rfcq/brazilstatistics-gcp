resource "google_bigquery_dataset" "datasets" {
  for_each = local.datasets_map

  project       = var.project_id
  dataset_id    = each.value["dataset_id"]
  friendly_name = each.value["dataset_friendly_name"]
  description   = each.value["dataset_description"]
  location      = each.value["dataset_region"]
}

resource "google_bigquery_table" "tables" {
  for_each = {for idx, table in local.tables_flattened : "${table["dataset_id"]}_${table["table_id"]}" => table}

  project    = var.project_id
  depends_on = [google_bigquery_dataset.datasets]
  dataset_id = each.value["dataset_id"]
  table_id   = each.value["table_id"]
  clustering = each.value["clustering"]

  dynamic "time_partitioning" {
    for_each = each.value["partition_type"] != null ? [1] : []

    content {
      type                     = each.value["partition_type"]
      field                    = each.value["partition_field"]
      expiration_ms            = each.value["expiration_ms"]
    }
  }

  schema = file("${path.module}/${each.value["table_schema_path"]}")
}