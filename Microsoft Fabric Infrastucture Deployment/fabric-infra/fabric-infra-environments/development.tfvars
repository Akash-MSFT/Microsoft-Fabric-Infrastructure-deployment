#### Fabric Workspace with Role Assignment and Lakehouse #####################

##### UPDATE THE VALUES AS REQUIRED ####################

fabric_workspaces = {
  "workspace_dev" = {
    display_name = "dev-ws"
    description  = "Dev workspace"
    roles = [
      {
        principal_id   =  ""  #security groups object id
        principal_type = "Group"
        role           = "Contributor"
      },
      {
        principal_id   = "" #security groups object id
        principal_type = "Group"
        role           = "Admin"
      },

      {
        principal_id   = "" #security groups object id
        principal_type = "Group"
        role           = "Viewer"
      }

    ]
    lakehouses = [
      {
        display_name = "dev_lh"
        description  = "IAC dev_lh"

      },
      {
        display_name = "dev_lh_sql"
        description  = "IAC dev_lh_sql"

      }
    ]
  },



  "workspace_test" = {
    display_name = ""
    description  = ""
    roles = [
      {
        principal_id   =  """"
        principal_type = "Group"
        role           = "Contributor"
      },
      {
        principal_id   = ""
        principal_type = "Group"
        role           = "Admin"
      },

      {
        principal_id   = ""
        principal_type = "Group"
        role           = "Viewer"
      }
    ]
    lakehouses = [
      {
        display_name = ""
        description  = ""

      }
    ]
  },

  "workspace_team" = {
    display_name = ""
    description  = ""
    roles = [
      {
        principal_id   =  """"
        principal_type = "Group"
        role           = "Contributor"
      },
      {
        principal_id   = ""
        principal_type = "Group"
        role           = "Admin"
      },

      {
        principal_id   = ""
        role           = "Viewer"
      }
    ]
    lakehouses = [
      {
        display_name = ""
        description  = ""

      }
    ]
  },
  "workspace_hr" = {
    display_name = ""
    description  = ""
    roles = [
      {
        principal_id   =  ""
        principal_type = "Group"
        role           = "Contributor"
      },
      {
        principal_id   = ""
        principal_type = "Group"
        role           = "Admin"
      },

      {
        principal_id   = ""
        principal_type = "Group"
        role           = "Viewer"
      }
    ]
    lakehouses = [
      {
        display_name = ""
        description  = ""

      }
    ]
  },

  "workspace_azure" = {
    display_name = ""
    description  = ""
    roles = [
      {
        principal_id   =  ""
        principal_type = "Group"
        role           = "Contributor"
      },
      {
        principal_id   = ""
        principal_type = "Group"
        role           = "Admin"
      },

      {
        principal_id   = ""
        principal_type = "Group"
        role           = "Viewer"
      }
    ]
    lakehouses = [
      {
        display_name = ""
        description  = ""

      }
    ]

  }
}



############################# Fabric Spark Custom Pool #############################


spark_pool_name                     = "fabric_spark_custom_pool_small"
node_family                         = "MemoryOptimized"
node_size                           = "Small"
auto_scale_enabled                  = true
min_node_count                      = 1
max_node_count                      = 9
dynamic_executor_allocation_enabled = true
min_executors                       = 1
max_executors                       = 5