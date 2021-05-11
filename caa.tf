# resource "cloudflare_record" "caa" {
#   count   = length(var.caa_records)
#   zone_id = var.zone_id
#   name    = element(var.caa_records[count.index], 0)
#   type    = "CAA"

#   data = {
#     flags = element(var.caa_records[count.index], 1)
#     tag   = element(var.caa_records[count.index], 2)
#     value = element(var.caa_records[count.index], 3)
#   }
# }
