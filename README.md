# Cloudflare DNS Record Module [.](https://www.geekandi.com/2018/11/10/cloudflare-terraform-dns-records/) | [.](https://gitlab.com/geekandi-terraform/cloudflare-dns-record-module)

Terraform [cloudflare_record](https://www.terraform.io/docs/providers/cloudflare/r/record.html)

> **Requires Terraform 0.12 or higher**

This module will loop over a passed `list` variables to create records in Cloudflare.

This module as tested supports:
* IPv4 records both proxied and non-proxy
* IPv6 records both proxied and non-proxy
* CNAME records both proxied and non-proxy
* SPF records
* TXT records
* MX records
* NS records
* SRV records

This module no longer supports:
* CAA records - throwing an error and not available in the API anymore either. [Reference](https://api.cloudflare.com/#dns-records-for-a-zone-create-dns-record)

Suggestion: you should use durable state storage.

This works great with Terraform [Workspaces](https://www.terraform.io/docs/state/workspaces.html)

## usage example
```
module "cloudflare_dns_records" {
  source           = "git::https://gitlab.com/geekandi-terraform/cloudflare-dns-record-module.git"
  domain           = "${var.domain}"
  "multi_records"  = "${var.multi_records}"
}
```

your `example.vars` file
```
domain = "example.com"

multi_records = [
  ["example.com", "204.255.255.131", 0, "A", "true"],
  ["www", "204.255.255.131", 0, "A", "true"],

  ["egads", "192.168.31.31", 0, "A", "false"],

  ["example.com", "2b:12b::131", 0, "AAAA", "true"],
  ["www", "2b:12b::131", 0, "AAAA", "true"],

  ["egads", "2b:12b::deadbeef", 0, "AAAA", "false"],


  ["example.com", "mail.example.com", "10", "MX", "false"],
  ["example.com", "mail2.example.com", "20", "MX", "false"],


  ["example.com", "v=spf1 ptr ip6:2001:dead:beef::/48 ip4:204.1.0.0/22 ~all", 0, "SPF", "false"],
  ["www", "v=spf1 -all", 0, "SPF", "false"],


  ["example.com", "v=spf1 ptr ip6:2001:dead:beef::/48 ip4:204.1.0.0/22 ~all", 0, "TXT", "false"],
  ["www", "v=spf1 -all", 0, "TXT", "false"],
]
```

## example command lines
```
terraform workspace new example.com
terraform workspace select example.com
terraform init -upgrade
terraform plan -var-file example.vars -out example.tfplan
terraform apply -var-file examples.var example.tfplan
terraform workspace select default
```

## required variables
* `domain` - the domain we are working against

## optional variables
* `multi_records` - `name`, `value`, `priority (integer)`, `type`, `proxied`
* `srv_records` - `item`, `proto`, `priority (integer)`, `weight (integer)`, `port (integer)`, `target (no trailing dot)`

No longer supported and commented out:
* `caa_records` - `name`, `flags`, `issue`, `value`

## TODO
- add examples for the rest of the DNS types
- figure out items for LOC records
