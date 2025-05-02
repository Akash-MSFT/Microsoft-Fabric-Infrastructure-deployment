# Description: This file contains the input variables for the fabric-infra module.

variable "fabric_workspaces" {
  description = "A map of fabric workspaces to create"
  type = map(object({
    display_name = string
    description  = string

    roles = list(object({
      principal_id   = string
      principal_type = string
      role           = string
    }))

    lakehouses = optional(list(object({
      display_name = string
      description  = string

    })), []) # Default to an empty list if lakehouses is not provided
  }))
}


# ##################### Fabric spark custom pool variables #####################


variable "spark_pool_name" {
  description = "Name of the spark pool name"
  type        = string
}

variable "node_family" {
  description = "Node family of the spark pool"
  type        = string
}

variable "node_size" {
  description = "Node size of the spark pool"
  type        = string
}

variable "auto_scale_enabled" {
  description = "Enable auto scale for the spark pool"
  type        = bool
}

variable "min_node_count" {
  description = "Minimum node count for the spark pool"
  type        = number
}

variable "max_node_count" {
  description = "Maximum node count for the spark pool"
  type        = number
}

variable "dynamic_executor_allocation_enabled" {
  description = "Enable dynamic executor allocation for the spark pool"
  type        = bool
}

variable "min_executors" {
  description = "Minimum executors for the spark pool"
  type        = number
}

variable "max_executors" {
  description = "Maximum executors for the spark pool"
  type        = number
}

