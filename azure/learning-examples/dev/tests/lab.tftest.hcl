mock_provider "azurerm" {}

run "network_only" {
  command = plan

  assert {
    condition     = output.resource_group_name == "tf-learning-dev-rg"
    error_message = "Dev must use its own resource group name."
  }

  assert {
    condition     = toset(keys(output.subnet_ids)) == toset(["app", "data"])
    error_message = "The network must have stable app and data subnet keys."
  }

  assert {
    condition     = length(output.nic_ids) == 0 && length(output.nic_private_ips) == 0
    error_message = "The default plan must not create a NIC."
  }
}

run "optional_nic" {
  command = plan

  variables {
    enable_nic = true
  }

  assert {
    condition     = length(output.nic_ids) == 1 && length(output.nic_private_ips) == 1
    error_message = "Enabling the NIC must create exactly one private network interface."
  }
}

run "invalid_environment" {
  command = plan

  module {
    source = "../modules/lab"
  }

  variables {
    environment  = "invalid"
    location     = "westus2"
    network_cidr = "10.10.0.0/16"
    subnets = {
      app = "10.10.1.0/24"
    }
  }

  expect_failures = [var.environment]
}
