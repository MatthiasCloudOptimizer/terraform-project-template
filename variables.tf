variable "location" {
  description = "Required - The Azure region where the resources will be created (e.g., 'germanywestcentral', 'germanynorth', 'westeurope')."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group."
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
}

variable "storage_account_name" {
  description = "Globally unique name of the Storage Account. Use only lowercase letters and numbers."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "The storage account name must contain 3 to 24 lowercase letters and numbers."
  }
}

variable "common_tags" {
  description = "Tags applied to the Azure resources."
  type        = map(string)
}
# ── Netzwerk ──────────────────────────────────────────────────────────────────
variable "vnet_address_space" {
  type        = string
  description = "Required - CIDR of the Spoke-VNet, e.g., 10.10.0.0/16"
}

variable "subnet_address_prefix" {
  type        = string
  description = "CIDR range of the subnet, for example 10.10.1.0/24."
}

# ── Storage Account ───────────────────────────────────────────────────────────────
variable "account_replication_type" {
  description = "Required - The replication type for the Storage Account. Accepted values are 'LRS', 'GRS', 'RAGRS', 'ZRS', 'GZRS', or 'RZRS'."
  type        = string
  default     = "ZRS"

  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RZRS"], var.account_replication_type)
    error_message = "The account_replication_type must be one of: LRS, GRS, RAGRS, ZRS, GZRS, or RZRS."
  }
}

