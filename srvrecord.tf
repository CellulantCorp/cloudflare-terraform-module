resource "cloudflare_record" "srv" {
  count   = length(var.srv_records)
  zone_id = var.zone_id
  name    = "${element(var.srv_records[count.index], 0)}.${element(var.srv_records[count.index], 1)}.${var.domain}"
  type    = "SRV"

  data = {
    service  = element(var.srv_records[count.index], 0)
    proto    = element(var.srv_records[count.index], 1)
    name     = var.domain
    priority = element(var.srv_records[count.index], 2)
    weight   = element(var.srv_records[count.index], 3)
    port     = element(var.srv_records[count.index], 4)
    target   = element(var.srv_records[count.index], 5)
  }
}
