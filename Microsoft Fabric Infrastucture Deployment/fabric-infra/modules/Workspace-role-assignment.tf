
resource "fabric_workspace_role_assignment" "fabric_workspace_role_assignment" {
  count = length(flatten([for workspace_key, workspace in var.fabric_workspaces :
    [for role in workspace.roles :
      {
        workspace_id   = fabric_workspace.fabric_workspace[workspace_key].id
        principal_id   = role.principal_id
        principal_type = role.principal_type
        role           = role.role
      }
    ]
  ]))

  workspace_id = flatten([for workspace_key, workspace in var.fabric_workspaces :
    [for role in workspace.roles :
      fabric_workspace.fabric_workspace[workspace_key].id
    ]
  ])[count.index]

  principal_id = flatten([for workspace_key, workspace in var.fabric_workspaces :
    [for role in workspace.roles : role.principal_id]
  ])[count.index]

  principal_type = flatten([for workspace_key, workspace in var.fabric_workspaces :
    [for role in workspace.roles : role.principal_type]
  ])[count.index]

  role = flatten([for workspace_key, workspace in var.fabric_workspaces :
    [for role in workspace.roles : role.role]
  ])[count.index]
}
