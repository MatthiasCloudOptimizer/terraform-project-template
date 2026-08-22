locals {
  resource_tags = merge(var.common_tags, {
    managed_by = "terraform"
    location   = var.location
  })
}
