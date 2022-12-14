##############################################################################
# Terraform Providers
##############################################################################

terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">=1.49.0"
    }
  }
  required_version = ">=1.2.9"
  experiments      = [module_variable_optional_attrs]
}

##############################################################################
