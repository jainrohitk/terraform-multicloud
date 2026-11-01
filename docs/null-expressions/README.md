# Understanding `null` in Terraform

`null` represents **absence or omission**. Write it without quotes: `"null"`
is a string, not a null value.

Null is different from `""`, `false`, `0`, `[]`, and `{}`. For a resource
argument, null behaves as though you omitted the argument: an optional argument
uses its documented default or remains unset, while a required argument fails.
Provider behavior determines what omission means for an existing resource;
do not assume it always preserves the remote value.

## Trying the examples

These are independent examples. Do not combine them with the existing Azure
configuration: Terraform loads every `.tf` file in its working directory.

Example 1 requires an AzureRM provider configuration to plan. Examples 2-4
need no cloud credentials or providers. Copy each example into a separate
scratch directory as `main.tf`, then run:

```powershell
terraform init
terraform console
```

Use Terraform 1.3 or newer for all examples. Example 4 uses optional object
attribute defaults, which require 1.3+. No `apply` is needed.

## Example 1: Omit optional Azure tags

```hcl
variable "tags" {
  type    = map(string)
  default = null
}

resource "azurerm_resource_group" "null_demo" {
  name     = "null-expression-demo-rg"
  location = "westus2"
  tags     = var.tags
}
```

- Omitted input: `var.tags` is null, so no explicit tags are supplied.
- `{ Environment = "dev" }`: supplies those tags.
- `{}`: supplies an explicitly empty map, not an absent value.
- Setting the required `name` argument to null would fail validation.

**Use case:** Let module callers omit optional settings. Check the provider's
documented behavior before updating existing tags with null or an empty map.

## Example 2: Variable defaults and `nullable`

```hcl
variable "flexible_location" {
  type     = string
  default  = "westus2"
  nullable = true
}

variable "fixed_location" {
  type     = string
  default  = "westus2"
  nullable = false
}
```

| Input | `flexible_location` | `fixed_location` |
|---|---|---|
| Omitted | `"westus2"` | `"westus2"` |
| Explicit null | null | `"westus2"` |
| `"eastus"` | `"eastus"` | `"eastus"` |
| `""` | `""` | `""` |

Create `nulls.tfvars`:

```hcl
flexible_location = null
fixed_location    = null
```

Run `terraform console -var-file="nulls.tfvars"`. Evaluate
`var.flexible_location == null` and `var.fixed_location`: the results are
`true` and `"westus2"`.

**Use case:** `nullable = false` guarantees a non-null input. Without a default,
explicit null is an error. Empty strings and null collection elements need
separate validation.

## Example 3: Conditional nulls and fallbacks

```hcl
variable "enable_tags" {
  type     = bool
  default  = false
  nullable = false
}

variable "display_name" {
  type    = string
  default = null
}

locals {
  resource_tags = var.enable_tags ? { Environment = "dev" } : null
  display_name  = coalesce(var.display_name, "learning-resource")
}
```

In the console:

- `local.resource_tags == null` returns `true` with default inputs.
- With `terraform console -var="enable_tags=true"`, `local.resource_tags`
  contains `{ Environment = "dev" }`.
- `local.display_name` returns `"learning-resource"` unless a non-empty name
  is supplied.

**Use case:** Pass conditional tags to an optional resource argument or turn
an optional input into a usable value. Conditional branches need compatible
types.

`coalesce` skips both null and empty strings. To preserve an empty string and
replace only null, use:

```hcl
var.display_name == null ? "learning-resource" : var.display_name
```

## Example 4: Optional object attributes

```hcl
variable "service" {
  type = object({
    description = optional(string)
    port        = optional(number, 8080)
  })
  default  = {}
  nullable = false
}
```

In the console, `var.service.description == null` returns `true`, and
`var.service.port` returns `8080`.

Create `nulls.tfvars`:

```hcl
service = {
  description = null
  port        = null
}
```

Run `terraform console -var-file="nulls.tfvars"`. The results stay the same:

- `optional(string)` has an implicit null default.
- `optional(number, 8080)` replaces an omitted or explicitly null attribute
  with `8080`.

**Use case:** Define structured module inputs with optional settings and
reliable attribute defaults.

## Common mistakes

- **Null is not an empty collection:** `length(null)` and iteration over null
  fail. Normalize an optional list with `var.items == null ? [] : var.items`.
- **`try` does not replace null:** `try(null, "fallback")` returns null.
  It catches evaluation errors, not absent values.
- **Null does not remove a resource:** Use `count` or `for_each` for conditional
  resource creation. A `removed` block addresses removal from state.
- **Null is not unknown:** Null is known absence; an unknown value is only
  determined later, often during apply.
- **Top-level null outputs are not normal state outputs:** Use a console
  comparison such as `var.value == null` to observe absence.

## Official references

- [Types and null](https://developer.hashicorp.com/terraform/language/expressions/types)
- [Input variables and nullable](https://developer.hashicorp.com/terraform/language/values/variables#disallowing-null-input-values)
- [Optional object attributes](https://developer.hashicorp.com/terraform/language/expressions/type-constraints#optional-object-type-attributes)
- [Conditional expressions](https://developer.hashicorp.com/terraform/language/expressions/conditionals)
- [coalesce](https://developer.hashicorp.com/terraform/language/functions/coalesce)
