# More Information: https://github.com/terraform-linters/tflint-ruleset-azurerm
# winget install TerraformLinters.tflint

plugin "azurerm" {
    enabled = true
    version = "0.32.0"
    source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}
