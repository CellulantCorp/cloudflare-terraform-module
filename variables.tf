variable "domain" {
  type        = string
  description = "zone domain name"
}

variable "zone_id" {
  type        = string
  description = "cloudflare zone id"
}

variable "api_token" {
  type        = string
  description = "cloudflare api token"
}

# still need to figure out SRV and LOC records

# name, value, priority (integer), type, proxied
variable "multi_records" {
  # type = list(string)
  type = list(tuple([string, string, number, string, bool]))
}

# item, proto, priority (integer), weight (integer), port (integer), target (no trailing dot)
variable "srv_records" {
  #type    = list(string)
  type    = list(tuple([string, string, number, number, number, string]))
  default = []
}

# name, flags, issue, value
variable "caa_records" {
  #type    = list(string)
  type    = list(tuple([string, number, string, string]))
  default = []
}
