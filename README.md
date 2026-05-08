# Composer3 — Terraform provisioning for Cloud Composer

This repository contains Terraform configuration to provision and manage a Google Cloud Composer ("Composer3") environment and its related infrastructure (networking, service accounts, APIs, and remote state). The code is intended to automate environment creation, updates, and teardown in a repeatable, reviewable way.

## Contents
- apis.tf — Enables required GCP APIs
- backend.tf — Remote state backend configuration (GCS / Terraform state)
- main.tf — High-level Composer resource(s) and glue resources
- networking.tf — VPC, subnets, firewall rules and networking dependencies
- providers.tf — Terraform provider configuration (google / google-beta)
- service_accounts.tf — Service account creation and IAM bindings
- variables.tf — Variable definitions and defaults

## Prerequisites
- Terraform 1.0+ installed
- gcloud CLI installed and authenticated to the target GCP project
- A GCP project with billing enabled
- Proper IAM to create resources (or a service account with necessary roles)

## Quick start
1. Review and set required variables (via CLI -var or a tfvars file). See variables.tf for available settings.

2. Initialize Terraform and remote backend (if using backend.tf):

   terraform init -input=false

3. Preview changes:

   terraform plan -var-file="secrets.tfvars" -out=plan.out

4. Apply changes:

   terraform apply -input=false "plan.out"

5. Destroy when no longer needed:

   terraform destroy -var-file="secrets.tfvars"

Note: Use a secure tfvars file (excluded from VCS) for credentials or sensitive values.

## Variable management
- Keep secrets out of version control. Use a local `secrets.tfvars` (add to .gitignore).
- The `variables.tf` file documents configurable values and sensible defaults.

## Remote state
- backend.tf configures remote state. Confirm the backend storage and locking configuration before running `terraform init` in a new workspace.

## Security & IAM
- Review service account roles in `service_accounts.tf`. Grant the least privilege necessary.
- Audit Cloud IAM bindings and tighten as required for production environments.

## Validation & troubleshooting
- Use `terraform validate` to validate configuration.
- Inspect `terraform plan` output carefully before apply.
- Check GCP Console for API enablement issues (apis.tf).

## Contributing
- Open issues or PRs for changes. Follow repository coding and review practices.
- Keep terraform formatting consistent: `terraform fmt` before committing.

## License & Contact
Pythian

---


