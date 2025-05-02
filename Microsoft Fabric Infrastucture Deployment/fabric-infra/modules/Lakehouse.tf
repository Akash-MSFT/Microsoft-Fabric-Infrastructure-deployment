

resource "fabric_lakehouse" "lakehouse" {
  count = length(flatten([
    for ws_key, ws in var.fabric_workspaces : [
      for lh in lookup(ws, "lakehouses", []) : {
        ws_key       = ws_key
        display_name = lh.display_name
        description  = lh.description
      }
    ]
  ]))

  display_name = flatten([
    for ws_key, ws in var.fabric_workspaces : [
      for lh in lookup(ws, "lakehouses", []) : lh.display_name
    ]
  ])[count.index]

  description = flatten([
    for ws_key, ws in var.fabric_workspaces : [
      for lh in lookup(ws, "lakehouses", []) : lh.description
    ]
  ])[count.index]

  workspace_id = flatten([
    for ws_key, ws in var.fabric_workspaces : [
      for lh in lookup(ws, "lakehouses", []) : fabric_workspace.fabric_workspace[ws_key].id
    ]
  ])[count.index]

  configuration = {
    enable_schemas = true
  }
}




