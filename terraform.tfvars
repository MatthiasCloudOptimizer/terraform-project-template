# ====================================
# Required Variables
# ====================================
resource_group_name  = "rg-terraform-example"
location             = "germanywestcentral"
vnet_name            = "vnet-terraform-example"
subnet_name          = "snet-storage"
storage_account_name = "tfexample20260822"

# Network
vnet_address_space    = "10.20.0.0/16"
subnet_address_prefix = "10.20.1.0/24"

# Storage
account_replication_type = "ZRS"

# Tags
common_tags = {
  environment = "test"
  source      = "terraform"
}
