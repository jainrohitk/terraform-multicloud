module "lab" {
  source = "../modules/lab"

  providers = {
    azurerm = azurerm
  }

  environment  = "dev"
  location     = var.location
  network_cidr = "10.10.0.0/16"
  enable_nic   = var.enable_nic

  subnets = {
    app  = "10.10.1.0/24"
    data = "10.10.2.0/24"
  }

  tags = {
    Owner = "LearningLab"
  }
}
