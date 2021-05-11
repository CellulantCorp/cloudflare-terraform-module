variable "domain" {
}

variable "zone_id" {
}

variable "tingg_me_api_token" {
}

# Required
variable "tingg_me_zone_id" {
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
