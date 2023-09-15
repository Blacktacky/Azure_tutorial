terraform{
  required_providers{
    azurerm={
      source="hashicorp/arurerm"
      version=">=3.70.0"#this version is for azurerm, NOT terraform version
    }
  }
  required_version=">=1.5.0"#this version is for Terraform Version, NOT azurerm
}

provider "azurerm"{
  features{}
  skip_provider_registration="true"
}
