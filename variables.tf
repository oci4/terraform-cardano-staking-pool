# provider parameters

variable "oci_base_provider" {
  type = object({
    api_fingerprint      = string
    api_private_key_path = string
    region               = string
    tenancy_id           = string
    user_id              = string
  })
  description = "oci provider parameters"
}


###########################
# Variable for Compartments
########################### 
variable "oci_cmp-cardano_vars" {
  type = object({
    compartment_id       = string
    description          = string
    name                 = string

  })
  description = "oci compartment parameters"
}

###########################
# Variable for Custom Images
########################### 
variable "oci_relay-node_vars" {
  type = object({
    display_name       = string
    source_uri          = string
  })
}

variable "oci_producer-node_vars" {
  type = object({
    display_name       = string
    source_uri          = string
  })
}


###########################
# Network Variables 
########################### 

variable "oci_vcn_vars" {
  type = object({
    vcn_cidr       = string
    display_name   = string
    public_subnet_cidr  = string
    public_subnet_display_name  = string
    public_subnet_route_table_display_name = string
    internet_gateway_name = string
  })
}


###########################
# Compute Variables 
########################### 

variable "oci_compute_cardano_relay_vars" {
  type = object({
    availability_domain  = string
    shape   = string
    shape_ocpu = string
    shape_memory = string
    display_name  = string
    public_subnet_display_name = string
    public_subnet_route_table_display_name = string
    internet_gateway_name = string
    assign_public_ip = bool
    ssh_public_key = string
  })
}

variable "oci_compute_cardano_producers_vars" {
  type = object({
    availability_domain  = string
    shape   = string
    shape_ocpu = string
    shape_memory = string
    display_name  = string
    public_subnet_display_name = string
    public_subnet_route_table_display_name = string
    internet_gateway_name = string
    assign_public_ip = bool
    ssh_public_key = string
  })
}
