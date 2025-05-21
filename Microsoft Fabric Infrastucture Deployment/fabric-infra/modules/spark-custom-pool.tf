##### Removing as its not required for now and created on workspace level not capacity level  ######


resource "fabric_spark_custom_pool" "spark_pool" {
  for_each = fabric_workspace.fabric_workspace

  workspace_id = each.value.id 
  name         = var.spark_pool_name
  node_family  = var.node_family
  node_size    = var.node_size
  type         = "Workspace"

  auto_scale = {
    enabled        = var.auto_scale_enabled
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  dynamic_executor_allocation = {
    enabled       = var.dynamic_executor_allocation_enabled
    min_executors = var.min_executors
    max_executors = var.max_executors
  }
}


