variable "balancing_mode" {
  type        = string
  description = "Balancing mode"
  default     = "RATE"
}

variable "backends" {
  type        = list
  description = "Backend config"
}
