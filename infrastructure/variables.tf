variable "statuscake_api_token" {
  description = "API Token for StatusCake"
  type        = string
  sensitive   = true
}
variable "contact_group_name" {
  description = "Navn på kontaktgruppen for varsler"
  type        = string
  default     = "Team Ole Konter Eskamen"
}

variable "contact_group_email" {
  description = "E-postadresse for varsler"
  type        = string
  default     = "ole.magnus.letrud@gmail.com"
}
variable "trigger_rate" {
  description = "Antall feil før varsel"
  type        = number
  default     = 10
}
variable "check_interval" {
  description = "Hvor ofte det blir gjort en sjekk"
  type        = number
  default     = 60
}
variable "timeout" {
  description = "Hvor lenge før timeout"
  type = number
  default = 30
}