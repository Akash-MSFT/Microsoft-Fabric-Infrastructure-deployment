# Workspace with Capacity and Identity
data "fabric_capacity" "fabric_capacity" {
  display_name = ""
}



resource "fabric_workspace" "fabric_workspace" {
  for_each = var.fabric_workspaces

  display_name = each.value.display_name
  description  = each.value.description
  capacity_id  = data.fabric_capacity.fabric_capacity.id

  identity = {
    type = "SystemAssigned"
  }
}



