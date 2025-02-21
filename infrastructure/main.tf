terraform {
  required_providers {
    statuscake = {
      source  = "StatusCakeDev/statuscake"
      version = "2.2.2"
    }
  }
}
resource "statuscake_uptime_check" "vg" {
  check_interval = 60
  confirmation   = 1
  name           = "VG Website Monitoring"
  trigger_rate   = 10

  http_check {
    timeout      = 20
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
