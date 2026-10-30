# Terraform Quiz — Reference Guide

Use this alongside the 100-question quiz. Find the topic you got wrong below and follow the link to the official HashiCorp doc for a proper deep-dive.

---

## Part 1 (Q1-50)

### Fundamentals & CLI basics (Q1-10)
- What Terraform is / IaC concept → https://developer.hashicorp.com/terraform/intro
- CLI commands overview (init, plan, apply, destroy, validate) → https://developer.hashicorp.com/terraform/cli/commands

### Providers, resources, data sources (Q11-13)
- Providers → https://developer.hashicorp.com/terraform/language/providers
- Resources → https://developer.hashicorp.com/terraform/language/resources/syntax
- Data sources → https://developer.hashicorp.com/terraform/language/data-sources

### Variables, outputs, references (Q14-16)
- Input variables → https://developer.hashicorp.com/terraform/language/values/variables
- Output values → https://developer.hashicorp.com/terraform/language/values/outputs
- Resource attribute references → https://developer.hashicorp.com/terraform/language/expressions/references

### Meta-arguments (Q17-20)
- count → https://developer.hashicorp.com/terraform/language/meta-arguments/count
- for_each → https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
- depends_on → https://developer.hashicorp.com/terraform/language/meta-arguments/depends_on
- lifecycle → https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle

### State fundamentals (Q21-22)
- State overview → https://developer.hashicorp.com/terraform/language/state

### State commands (Q23-27)
- terraform import → https://developer.hashicorp.com/terraform/cli/commands/import
- terraform state mv/rm → https://developer.hashicorp.com/terraform/cli/commands/state/mv
- terraform state list/show → https://developer.hashicorp.com/terraform/cli/commands/state/list
- -replace (modern taint replacement) → https://developer.hashicorp.com/terraform/cli/commands/plan#replace-address

### State locking & backends (Q28-30)
- State locking → https://developer.hashicorp.com/terraform/language/state/locking
- Backends overview → https://developer.hashicorp.com/terraform/language/backend

### Modules (Q31-40)
- Modules overview → https://developer.hashicorp.com/terraform/language/modules
- Module blocks & sources → https://developer.hashicorp.com/terraform/language/modules/sources
- Terraform Registry → https://registry.terraform.io
- Module versioning → https://developer.hashicorp.com/terraform/language/modules/syntax#version

### HCL functions & expressions (Q41-50)
- Built-in functions (concat, length, lookup, merge, split, join) → https://developer.hashicorp.com/terraform/language/functions
- Local values → https://developer.hashicorp.com/terraform/language/values/locals
- Conditional expressions → https://developer.hashicorp.com/terraform/language/expressions/conditionals
- Dynamic blocks → https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks

---

## Part 2 (Q51-100)

### Lock file, fmt, validate, show, output (Q51-55)
- Dependency lock file → https://developer.hashicorp.com/terraform/language/files/dependency-lock
- terraform fmt → https://developer.hashicorp.com/terraform/cli/commands/fmt
- terraform validate → https://developer.hashicorp.com/terraform/cli/commands/validate
- terraform show → https://developer.hashicorp.com/terraform/cli/commands/show

### Plan/apply flags, graph, console (Q56-60)
- -target flag → https://developer.hashicorp.com/terraform/cli/commands/plan#resource-targeting
- terraform graph → https://developer.hashicorp.com/terraform/cli/commands/graph
- terraform console → https://developer.hashicorp.com/terraform/cli/commands/console

### Workspaces (Q61-65)
- Workspaces → https://developer.hashicorp.com/terraform/language/state/workspaces
- CLI workspace commands → https://developer.hashicorp.com/terraform/cli/commands/workspace

### Provisioners (Q66-70)
- Provisioners overview (and why to avoid them) → https://developer.hashicorp.com/terraform/language/resources/provisioners/syntax
- local-exec → https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec
- remote-exec → https://developer.hashicorp.com/terraform/language/resources/provisioners/remote-exec

### Variables in depth (Q71-76)
- Variable definitions & precedence → https://developer.hashicorp.com/terraform/language/values/variables#variable-definition-precedence
- .tfvars files → https://developer.hashicorp.com/terraform/language/values/variables#variable-definitions-tfvars-files
- Type constraints → https://developer.hashicorp.com/terraform/language/expressions/type-constraints
- Sensitive values → https://developer.hashicorp.com/terraform/language/values/variables#suppressing-values-in-cli-output

### Secrets & security scanning (Q77-78)
- Managing sensitive data → https://developer.hashicorp.com/terraform/language/state/sensitive-data
- tfsec (now part of Trivy) → https://aquasecurity.github.io/tfsec/

### CI/CD patterns (Q79-82)
- Saved plan files → https://developer.hashicorp.com/terraform/cli/commands/plan#out-filename
- -auto-approve → https://developer.hashicorp.com/terraform/cli/commands/apply#auto-approve
- Terraform in automation (CI/CD guide) → https://developer.hashicorp.com/terraform/tutorials/automation/automate-terraform

### Drift & refresh (Q83-85)
- Refresh-only mode → https://developer.hashicorp.com/terraform/cli/commands/plan#planning-modes

### Version constraints & provider aliases (Q86-90)
- required_providers → https://developer.hashicorp.com/terraform/language/providers/requirements
- required_version → https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
- Version constraint syntax → https://developer.hashicorp.com/terraform/language/expressions/version-constraints
- Provider aliases (multiple configurations) → https://developer.hashicorp.com/terraform/language/providers/configuration#alias-multiple-provider-configurations

### Advanced state operations (Q91-95)
- terraform state show → https://developer.hashicorp.com/terraform/cli/commands/state/show
- terraform state pull/push → https://developer.hashicorp.com/terraform/cli/commands/state/pull

### Terraform Cloud, Sentinel, testing (Q96-100)
- Terraform Cloud overview → https://developer.hashicorp.com/terraform/cloud-docs
- Sentinel policy-as-code → https://developer.hashicorp.com/sentinel
- Terraform Cloud vs Enterprise → https://developer.hashicorp.com/terraform/enterprise
- Terratest → https://terratest.gruntwork.io/

---

**Tip:** Whenever the quiz explanation feels too brief, search the topic name directly on `developer.hashicorp.com/terraform` — HashiCorp's docs are consistently well-organized and are the most reliable source (more reliable than random blog posts) for anything version-specific.
