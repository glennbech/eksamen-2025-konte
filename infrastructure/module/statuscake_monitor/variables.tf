variable "site_name" {
  description = "Navnet på nettsiden"
  type        = string
}

variable "site_url" {
  description = "URL til nettsidem"
  type = string
}

variable "check_interval" {
  description = "Hvor ofte sjekken skal skje"
  type = number
}

variable "trigger_rate" {
  description = "hvro mange feil før alarm utløses"
  type = number
}

variable "timeout" {
  description = "Timeout for HTTP-sjekk"
  type = number
}

variable "contact_group_id" {
  description = "ID til kontaktgruppen som får varsler"
  type        = string
}
