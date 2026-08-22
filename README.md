# Terraform Project Template

A beginner-friendly Terraform project template designed to help you understand how a real Terraform project can be structured.

This repository focuses on learning Terraform and HashiCorp Configuration Language (HCL) with four Azure resources: one resource group, one virtual network, one subnet, and one storage account.

## What You Will Learn

This repository demonstrates:

- How Terraform projects are typically organized
- Why Terraform configurations are split into multiple files
- How variables work
- How locals help reduce duplication
- How outputs provide deployment information
- How environment-specific configurations can be managed
- How Terraform state backends are configured
- How a resource group, virtual network, subnet, and storage account fit together

## Who Is This For?

This project is intended for:

- Terraform beginners
- Students and self-learners
- Cloud Engineers starting with Infrastructure as Code
- Anyone who wants to understand Terraform project structures

## Project Structure

```text
.
├── config
│   ├── np.backend.hcl
│   ├── np.tfvars
│   ├── pr.backend.hcl
│   └── pr.tfvars
│
├── backend.tf
├── data.tf
├── locals.tf
├── main.tf
├── outputs.tf
├── provider.tf
├── terraform.tf
├── terraform.tfvars
├── variables.tf
└── README.md
```

## Understanding The Files

### terraform.tf

Contains Terraform settings and version requirements.

Typical content:

- Required Terraform version
- Required providers

Why it exists:

Terraform versions and provider versions should be controlled to avoid unexpected behavior.

---

### provider.tf

Defines the provider Terraform should use.

Examples:

- AzureRM
- AWS
- Google

Why it exists:

Separating provider configuration improves readability and makes authentication settings easier to find.

---

### variables.tf

Defines the project's input variables.

Examples:

- location
- environment
- project_name

Why it exists:

Variables prevent hardcoded values and make configurations reusable.

---

### terraform.tfvars

Provides values for variables.

Why it exists:

Separates configuration values from the Terraform implementation.

---

### locals.tf

Defines reusable calculated values.

Examples:

- Naming conventions
- Resource prefixes
- Common tags

Why it exists:

Locals reduce duplicated code and improve readability.

---

### data.tf

This file remains as an extension point for future data sources. The current example does not read existing Azure resources.

---

### main.tf

Contains the infrastructure resources that Terraform manages.

Why it exists:

This file usually contains the core infrastructure configuration.

---

### outputs.tf

Defines values Terraform returns after deployment.

Examples:

- Resource IDs
- Resource Names
- Endpoints

Why it exists:

Outputs provide useful information to users and other Terraform configurations.

---

### backend.tf

Configures where the Terraform state is stored.

Examples:

- Azure Storage Account
- S3 Bucket
- Terraform Cloud

Why it exists:

The Terraform state file is Terraform's source of truth and should normally be stored remotely.

## Environment Configuration

The config directory contains environment-specific configuration files.

Example environments:

- Non-Production (NP)
- Production (PR)

This allows the same Terraform code to be reused across multiple environments.

### np.tfvars

Contains variable values for the non-production environment.

### pr.tfvars

Contains variable values for the production environment.

### np.backend.hcl

Contains backend configuration for non-production.

### pr.backend.hcl

Contains backend configuration for production.

## Running Terraform

The configuration uses the local Azure CLI session for authentication:

```bash
az login
```

The example creates exactly four Azure resources. A storage account is not technically inside a virtual network. Access is restricted with a `Microsoft.Storage` service endpoint and storage network rules on the subnet. Private endpoints, private DNS, and hub peering are intentionally outside this example.

For a local start:

```bash
terraform init -backend=false
terraform validate
terraform plan -refresh=false -var-file="./config/np.tfvars"
```

For a deployment using local state:

Initialize Terraform:

```bash
terraform init -reconfigure -backend=false
```

Validate the configuration:

```bash
terraform validate
```

Create a deployment plan:

```bash
terraform plan \
  -var-file="./config/np.tfvars"
```

Deploy:

```bash
terraform apply \
  -var-file="./config/np.tfvars"
```

`backend.tf` and the files under `config/` remain as an optional example for an existing Azure Storage state backend. The backend itself is not created by this example.

## Important Note

Terraform automatically loads all `.tf` files in the same directory.

The separation into:

- variables.tf
- locals.tf
- data.tf
- main.tf
- outputs.tf

is not technically required.

It simply improves readability, maintainability, and collaboration.

## License

MIT License

## Topics

Terraform, HCL, Infrastructure as Code, Terraform Learning, Terraform Beginners, Terraform Project Structure, Terraform Variables, Terraform Locals, Terraform Outputs, Terraform Backend Configuration