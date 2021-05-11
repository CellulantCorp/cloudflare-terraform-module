resource "cloudflare_record" "multi" {
  count    = length(var.multi_records)
  zone_id  = var.zone_id                                # required
  name     = element(var.multi_records[count.index], 0) # required
  value    = element(var.multi_records[count.index], 1) # required
  priority = element(var.multi_records[count.index], 2) # optional IRL, required in var passing, can be ""
  type     = element(var.multi_records[count.index], 3) # required
  proxied  = element(var.multi_records[count.index], 4) # optional IRL, required in var passing, boolean
  ttl      = "1"                                        # this is default
}
