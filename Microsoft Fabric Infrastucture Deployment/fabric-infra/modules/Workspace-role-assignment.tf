
resource "fabric_workspace_role_assignment" "fabric_workspace_role_assignment" {
  count = length(flatten([for workspace_key, workspace in var.fabric_workspaces :
    [for role in workspace.roles :
      {
        workspace_id = fabric_workspace.fabric_workspace[workspace_key].id
        principal = {
          id   = role.principal_id
          type = role.principal_type
        }
        role = role.role
      }
    ]
  ]))

  workspace_id = flatten([for workspace_key, workspace in var.fabric_workspaces :
    [for role in workspace.roles :
      fabric_workspace.fabric_workspace[workspace_key].id
    ]
  ])[count.index]

  principal = flatten([for workspace_key, workspace in var.fabric_workspaces :
    [for role in workspace.roles : {
      id   = role.principal_id
      type = role.principal_type
    }]
  ])[count.index]

  role = flatten([for workspace_key, workspace in var.fabric_workspaces :
    [for role in workspace.roles : role.role]
  ])[count.index]
}
