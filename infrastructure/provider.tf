provider "statuscake" {
  api_token = var.statuscake_api_token
  min_backoff  = 2
  max_backoff  = 10
}
