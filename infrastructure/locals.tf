locals {
  datasets_array    = jsondecode(file("${path.module}/datasets/datasets.json"))
  datasets_map      = {for idx, val in local.datasets_array : idx => val}
  tables_flattened = flatten([
    for dataset in local.datasets_map : [
      for table in dataset["tables"] : {
        dataset_id              = dataset["dataset_id"]
        table_id                = table["table_id"]
        table_schema_path        = table["table_schema_path"]
        partition_type          = try(table["partition_type"], null)
        partition_field         = try(table["partition_field"], null)
        expiration_ms           = try(table["expiration_ms"], null)
        clustering             = try(table["clustering"], [])
      }
    ]
  ])
}