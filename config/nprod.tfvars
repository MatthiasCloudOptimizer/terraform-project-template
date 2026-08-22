# ====================================
# Required Variables
# ====================================
resource_group_name  = "rg-terraform-example-np"
location             = "germanywestcentral"
vnet_name            = "vnet-terraform-example-np"
subnet_name          = "snet-storage"
storage_account_name = "tfexamplenp20260822"

# Network
vnet_address_space    = "10.20.0.0/16"
subnet_address_prefix = "10.20.1.0/24"

# Storage
account_replication_type     = "GRS"

# Tags
common_tags = {
  environment = "non-production"
  source      = "terraform"
}





