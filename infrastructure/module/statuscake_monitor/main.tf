terraform {
  required_providers {
    statuscake = {
      source  = "StatusCakeDev/statuscake"
      version = "2.2.2"
    }
  }
}
resource "statuscake_uptime_check" "this" {
  check_interval = var.check_interval
  confirmation = 1
  name = var.site_name
  trigger_rate = var.trigger_rate
  contact_groups = [var.contact_group_id]

  http_check {
    timeout = var.timeout
    validate_ssl = false
    status_codes = ["200", "301", "302"]
    follow_redirects = true
  }

  monitored_resource {
    address = var.site_url
  }

  tags = ["production"]
}
