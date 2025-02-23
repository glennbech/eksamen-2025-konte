variable "statuscake_api_token" {
  description = "API token for StatusCake"
  type        = string
  sensitive   = true
}

variable "contact_group_name" {
  description = "Navnet på contact group"
  type = string
}

variable "contact_group_email" {
  description = "E-postadresse for contact group"
  type = string
}

variable "check_interval" {
  description = "Hvor ofte sjekken skal skje"
  type = number
  default = 300
}

variable "trigger_rate" {
  description = "feil før alarm utløses"
  type = number
  default = 1
}

variable "timeout" {
  description = "Timeout for HTTP-sjekk"
  type = number
  default = 20
}
