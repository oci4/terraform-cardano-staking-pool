

###########################
# Cardano Compartment
########################### 
resource "oci_identity_compartment" "cardano-compartment" {
    # Required
    compartment_id = var.oci_cmp-cardano_vars.compartment_id
    description = var.oci_cmp-cardano_vars.description
    name = var.oci_cmp-cardano_vars.name
}


###########################
# Cardano Custom Images
########################### 

resource "oci_core_image" "relay-node_image" {
    #Required
    compartment_id = oci_identity_compartment.cardano-compartment.id
    display_name = var.oci_relay-node_vars.display_name

    image_source_details {
        source_type = "objectStorageUri"
        source_uri = var.oci_relay-node_vars.source_uri
    }
}

resource "oci_core_image" "producer-node_image" {
    #Required
    compartment_id = oci_identity_compartment.cardano-compartment.id
    display_name = var.oci_producer-node_vars.display_name

    image_source_details {
        source_type = "objectStorageUri"
        source_uri = var.oci_producer-node_vars.source_uri
    }
}

###########################
# Cardano Networking
########################### 
resource "oci_core_vcn" "cardano-vcn" {
  cidr_block = var.oci_vcn_vars.vcn_cidr
  compartment_id = oci_identity_compartment.cardano-compartment.id
  display_name = var.oci_vcn_vars.display_name
}

resource "oci_core_internet_gateway" "cardano_internet_gateway" {
    #Required
    depends_on = [oci_core_vcn.cardano-vcn]
    compartment_id = oci_identity_compartment.cardano-compartment.id
    vcn_id = oci_core_vcn.cardano-vcn.id
    enabled = "true"
    display_name = var.oci_vcn_vars.internet_gateway_name
}

resource "oci_core_route_table" "cardano_public_subnet_route_table" {
    #Required
    depends_on = [oci_core_vcn.cardano-vcn]
    compartment_id = oci_identity_compartment.cardano-compartment.id
    vcn_id = oci_core_vcn.cardano-vcn.id
    display_name = var.oci_vcn_vars.public_subnet_route_table_display_name

    route_rules {
        #Route to internet
        network_entity_id = oci_core_internet_gateway.cardano_internet_gateway.id
        destination = "0.0.0.0/0"
        destination_type = "CIDR_BLOCK"
    }
}


resource "oci_core_subnet" "cardano-public-subnet" {
    #Required
    depends_on = [oci_core_route_table.cardano_public_subnet_route_table]
    cidr_block = var.oci_vcn_vars.public_subnet_cidr
    compartment_id = oci_identity_compartment.cardano-compartment.id
    vcn_id = oci_core_vcn.cardano-vcn.id
    display_name = var.oci_vcn_vars.public_subnet_display_name
    route_table_id = oci_core_route_table.cardano_public_subnet_route_table.id
}


###########################
# Cardano Nodes
########################### 

resource "oci_core_instance" "relay_node" {
    #Required
    availability_domain = var.oci_compute_cardano_relay_vars.availability_domain
    compartment_id = oci_identity_compartment.cardano-compartment.id
    shape = var.oci_compute_cardano_relay_vars.shape

    create_vnic_details {
        assign_public_ip = var.oci_compute_cardano_relay_vars.assign_public_ip
        subnet_id = oci_core_subnet.cardano-public-subnet.id
    }

    display_name = var.oci_compute_cardano_relay_vars.display_name
    metadata = {
        ssh_authorized_keys = var.oci_compute_cardano_relay_vars.ssh_public_key
    }

    shape_config {
        memory_in_gbs = var.oci_compute_cardano_relay_vars.shape_memory
        ocpus = var.oci_compute_cardano_relay_vars.shape_ocpu
    }

    source_details {
        #Required
        source_id = oci_core_image.relay-node_image.id
        source_type = "image"
    }

    timeouts {
        create = "60m"
    }

    preserve_boot_volume = false
}

resource "oci_core_instance" "producer_node" {
    #Required
    availability_domain = var.oci_compute_cardano_producers_vars.availability_domain
    compartment_id = oci_identity_compartment.cardano-compartment.id
    shape = var.oci_compute_cardano_producers_vars.shape

    create_vnic_details {
        assign_public_ip = var.oci_compute_cardano_producers_vars.assign_public_ip
        subnet_id = oci_core_subnet.cardano-public-subnet.id
    }

    display_name = var.oci_compute_cardano_producers_vars.display_name
    metadata = {
        ssh_authorized_keys = var.oci_compute_cardano_producers_vars.ssh_public_key
    }

    shape_config {
        memory_in_gbs = var.oci_compute_cardano_producers_vars.shape_memory
        ocpus = var.oci_compute_cardano_producers_vars.shape_ocpu
    }

    source_details {
        #Required
        source_id = oci_core_image.producer-node_image.id
        source_type = "image"
    }

    timeouts {
        create = "60m"
    }

    preserve_boot_volume = false
}