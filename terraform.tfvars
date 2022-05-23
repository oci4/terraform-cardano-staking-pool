###########################
# Provider Parameters
########################### 

oci_base_provider = {
  api_fingerprint      = ""
  api_private_key_path = ""
  region               = "eu-frankfurt-1"
  tenancy_id           = ""
  user_id              = ""
}


###########################
# Variable for Compartments
########################### 
oci_cmp-cardano_vars = {
  compartment_id      = "ocid1.tenancy.oc1..aaaaaaaayusuwcgjdjoc4itenayywdprkcfkkpwjkvgi4euy35ffxmt746jq"
  description         = "compartment for production"
  name                = "cardano-pool"
}


###########################
# Cardano Custom Images
########################### 
oci_relay-node_vars = {
  display_name         = "cardano-relay-image"
  source_uri           = "https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/R_B4yrsVG9Ba8_E2Qu0LfK0YOlxCay1zxnv21zFLhmDGe-SFfIXBl2X0AFvSkJ8-/n/frok1agvptm0/b/cardano-images/o/oci-cardano-relay-node-image"
}

oci_producer-node_vars = {
  display_name         = "cardano-producer-image"
  source_uri           = "https://objectstorage.eu-frankfurt-1.oraclecloud.com/p/f0gqgeBM4SoZ3xonRXg8fzQciT_ZKXk_-2iqqp9CfTVidqBs86yiPo_EC9jKEFpt/n/frok1agvptm0/b/cardano-images/o/oci-cardano-producer-node-image"
}


###########################
# VCN Parameters
########################### 

oci_vcn_vars = {
  vcn_cidr       = "10.0.0.0/16"
  display_name   = "vcn-cardano-pool"
  public_subnet_cidr  = "10.0.1.0/24"
  public_subnet_display_name = "public_subnet-cardano-pool"
  public_subnet_route_table_display_name = "public_subnet-cardano-pool_route_table"
  internet_gateway_name = "cardano-internet-gw"
}

###########################
# Compute Variables 
########################### 

oci_compute_cardano_relay_vars = {
  availability_domain  = "gJpq:EU-FRANKFURT-1-AD-2"
  shape   = "VM.Standard.E4.Flex"
  shape_ocpu = "2"
  shape_memory = "16"
  display_name  = "cardano-relay-node"
  public_subnet_display_name = "public_subnet-cardano-pool"
  public_subnet_route_table_display_name = "public_subnet-cardano-pool_route_table"
  internet_gateway_name = "cardano-internet-gw"
  assign_public_ip = "true"
  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCXxKxxh2caZaJqpeL/9vNNrWQ9xnXCGdEbxiL48Lov8n0q+aH9OEyi3QOgp/13wrqD1In4rHdlwwQvQYoP9gRrGoI1GV2LXqw+RuvUU4EBZosH7zH+Hm0quSg7nmU69E3wUrsCArELNPHOdiCyMu8xjvYP1pAnja6b2NETQ4MvuE/G6TD0PNE0hRJRu57wEUPsfmCraIIlx/qMByb82Im5LvVl7XQ4BwY+dq4ACs2opXvHINv0E1mr/xmaLfdb0NppVk17q0maZqe7oo9D+B/zLhOl236ltRrjRoSLSg1TMNftKy2SkGS14Z77wsXhBnYjTCzH60gA0/BWWh9Y5kVJ ssh-key-2022-05-11"
}

oci_compute_cardano_producers_vars = {
  availability_domain  = "gJpq:EU-FRANKFURT-1-AD-2"
  shape   = "VM.Standard.E4.Flex"
  shape_ocpu = "2"
  shape_memory = "16"
  display_name  = "cardano-producer-node"
  public_subnet_display_name = "public_subnet-cardano-pool"
  public_subnet_route_table_display_name = "public_subnet-cardano-pool_route_table"
  internet_gateway_name = "cardano-internet-gw"
  assign_public_ip = "true"
  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCXxKxxh2caZaJqpeL/9vNNrWQ9xnXCGdEbxiL48Lov8n0q+aH9OEyi3QOgp/13wrqD1In4rHdlwwQvQYoP9gRrGoI1GV2LXqw+RuvUU4EBZosH7zH+Hm0quSg7nmU69E3wUrsCArELNPHOdiCyMu8xjvYP1pAnja6b2NETQ4MvuE/G6TD0PNE0hRJRu57wEUPsfmCraIIlx/qMByb82Im5LvVl7XQ4BwY+dq4ACs2opXvHINv0E1mr/xmaLfdb0NppVk17q0maZqe7oo9D+B/zLhOl236ltRrjRoSLSg1TMNftKy2SkGS14Z77wsXhBnYjTCzH60gA0/BWWh9Y5kVJ ssh-key-2022-05-11"
}