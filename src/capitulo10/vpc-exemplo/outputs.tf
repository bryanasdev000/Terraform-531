output id_subnet {
  value = google_compute_subnetwork.vpc_subnet.id
  description = "ID da subnet criada"
}

output gateway_subnet {
  value = google_compute_subnetwork.vpc_subnet.gateway_address
  description = "IP do gateway dessa subnet"
}

output selflink_subnet {
  value = google_compute_subnetwork.vpc_subnet.self_link
  description = "Self link da subnet"
}

output id_net {
  value = google_compute_network.vpc_network.id
  description = "ID da VPC criada"
}

output gateway_net {
  value = google_compute_network.vpc_network.gateway_ipv4
  description = "IP do gateway dessa VPC"
}

output selflink_net {
  value = google_compute_network.vpc_network.self_link
  description = "Self link da VPC"
}



