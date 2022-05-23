provider "oci" {
  tenancy_ocid         = var.oci_base_provider.tenancy_id
  user_ocid            = var.oci_base_provider.user_id
  fingerprint          = var.oci_base_provider.api_fingerprint
  private_key_path     = var.oci_base_provider.api_private_key_path
  region               = var.oci_base_provider.region
  disable_auto_retries = false
}