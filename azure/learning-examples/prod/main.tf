module "lab" {
  source = "../modules/lab"

  providers = {
    azurerm = azurerm
  }

  environment  = "prod"
  location     = var.location
  network_cidr = "10.20.0.0/16"
  enable_nic   = var.enable_nic

  subnets = {
    app  = "10.20.1.0/24"
    data = "10.20.2.0/24"
  }

  tags = {
    Owner = "LearningLab"
  }
}
