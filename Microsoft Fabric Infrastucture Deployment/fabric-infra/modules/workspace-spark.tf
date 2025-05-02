# Create Spark Workspace Settings for Each Workspace Dynamically
resource "fabric_spark_workspace_settings" "spark_settings" {
  for_each   = fabric_workspace.fabric_workspace
  depends_on = [fabric_workspace.fabric_workspace]

  workspace_id = each.value.id

  high_concurrency = {
    notebook_interactive_run_enabled = true
    notebook_pipeline_run_enabled    = true
  }
}
 