terraform {
  required_providers {
    statuscake = {
      source  = "StatusCakeDev/statuscake"
      version = "2.2.2"
    }
  }
}
resource "statuscake_contact_group" "ops_team" {
  name    = var.contact_group_name
  email_addresses  = [var.contact_group_email]
}
resource "statuscake_uptime_check" "vg" {
  check_interval = var.check_interval
  confirmation   = 1
  name           = "VG Website Monitoring"
  trigger_rate   = var.trigger_rate
  contact_groups = [statuscake_contact_group.ops_team.id]
  http_check {
    timeout      = var.timeout
    validate_ssl = false
    status_codes = ["200","301","302"]
    follow_redirects = true
  }

  monitored_resource {
    address = "https://www.vg.no/"
  }

  tags = ["production"]
}

output "vg_uptime_check_id" {
  value = statuscake_uptime_check.vg.id
}
