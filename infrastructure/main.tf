terraform {
  required_providers {
    statuscake = {
      source  = "StatusCakeDev/statuscake"
      version = "2.2.2"
    }
  }
}

resource "statuscake_contact_group" "ops_team" {
  name            = var.contact_group_name
  email_addresses = [var.contact_group_email]
}

module "vg_monitor" {
  source = "./modules/statuscake_monitor"
  site_name = "VG Website Monitoring"
  site_url = "https://www.vg.no/"
  check_interval = var.check_interval
  trigger_rate = var.trigger_rate
  timeout = var.timeout
  contact_group_id = statuscake_contact_group.ops_team.id
}

module "xkcd_monitor" {
  source = "./modules/statuscake_monitor"
  site_name = "xkcd monitor"
  site_url = "https://xkcd.com/"
  check_interval = var.check_interval
  trigger_rate = var.trigger_rate
  timeout = var.timeout
  contact_group_id = statuscake_contact_group.ops_team.id
}
