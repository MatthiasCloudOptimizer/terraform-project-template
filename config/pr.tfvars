# ====================================
# Required Variables
# ====================================

resource_group_name      = "rg-terraform-example-pr"
location                 = "germanywestcentral"
vnet_name                = "vnet-terraform-example-pr"
subnet_name              = "snet-storage"
storage_account_name     = "tfexamplepr20260822"
vnet_address_space       = "10.20.0.0/16"
subnet_address_prefix    = "10.20.1.0/24"
account_replication_type = "GRS"


common_tags = {
  environment = "production"
  source      = "terraform"
}


# ====================================
# Optional Variables (uncomment to customize)
# ====================================

# caf_prefixes = ["prv", "project"]  # Prefixes for resource naming

# caf_suffixes = ["001"]  # Suffixes for resource naming

# region_short = {
#   "germanywestcentral" = "gwc"
#   "westeurope"         = "westeu"
# }


