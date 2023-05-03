terraform {
  required_version = ">= 0.13"
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
  }
}

variable "CLOUDFLARE_EMAIL" {
  type      = string
}

variable "CLOUDFLARE_TOKEN" {
  type      = string
  sensitive = true
}

variable "CLOUDFLARE_ZONE_ID" {
  type    = string
}

provider "cloudflare" {
  email   = var.CLOUDFLARE_EMAIL
  api_key = var.CLOUDFLARE_TOKEN
}

resource "cloudflare_page_rule" "_223n_tech_rule" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  target   = "blog.223n.tech/*"
  priority = 1
  actions {
    ssl              = "strict"
    always_use_https = true
  }
}

resource "cloudflare_zone_settings_override" "_223n_tech_setting" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  settings {
    ipv6             = "on"
    ssl              = "strict"
    always_use_https = "on"
  }
}

resource "cloudflare_record" "_223n_tech_mx1" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  type     = "MX"
  name     = "@"
  value    = "aspmx.l.google.com"
  proxied  = false
  priority = 1
}

resource "cloudflare_record" "_223n_tech_mx2" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  type     = "MX"
  name     = "@"
  value    = "alt1.aspmx.l.google.com"
  proxied  = false
  priority = 5
}

resource "cloudflare_record" "_223n_tech_mx3" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  type     = "MX"
  name     = "@"
  value    = "alt2.aspmx.l.google.com"
  proxied  = false
  priority = 5
}

resource "cloudflare_record" "_223n_tech_mx4" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  type     = "MX"
  name     = "@"
  value    = "alt3.aspmx.l.google.com"
  proxied  = false
  priority = 10
}

resource "cloudflare_record" "_223n_tech_mx5" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  type     = "MX"
  name     = "@"
  value    = "alt4.aspmx.l.google.com"
  proxied  = false
  priority = 10
}

resource "cloudflare_record" "_223n_tech_google_site_verification" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  type    = "TXT"
  name    = "@"
  value   = "google-site-verification=j2iRgDV1dcpeEU8SJ0VYd9kTnnPGQvWTS9zJsJv9Fv0"
  proxied = false
}

resource "cloudflare_record" "_223n_tech_spf" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  type    = "TXT"
  name    = "@"
  value   = "v=spf1 include:_spf.google.com ~all"
  proxied = false
}

resource "cloudflare_record" "_223n_tech_dmarc" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  type    = "TXT"
  name    = "_dmarc"
  value   = "v=DMARC1; p=none; rua=mailto:80be9f8e61b44a21826e8d7c5ac60611@dmarc-reports.cloudflare.net"
  proxied = false
}

resource "cloudflare_record" "_223n_tech_dkim" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  type    = "TXT"
  name    = "google._domainkey"
  value   = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCe6dL29XcAvNXSODgRkeekGQu3nh3iXi0H1T9eIaXPX3GQBCmDSSwxFmhaA76BNKrpdFEpZ3CrElz92AD0tL2tdXoyPXydG+rlEsvKn+bn1WnIgL5CvjXlAARSbosINRIIXyT47m84V3CvEDq/IUx4P27jck7p5uYiFH3/Kb3evQIDAQAB"
  proxied = false
}

resource "cloudflare_record" "_223n_tech_blog_google_search_console" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  type    = "TXT"
  name    = "google_search_console"
  value   = "google-site-verification=j2iRgDV1dcpeEU8SJ0VYd9kTnnPGQvWTS9zJsJv9Fv0"
  proxied = false
}

resource "cloudflare_record" "_223n_tech_postmaster_tools" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  type    = "TXT"
  name    = "google_postmaster_tools"
  value   = "google-site-verification=Ap7XoQzIOZg2oUu-_ROqhQCpXgg-Z8wRXBOvSiguV5o"
  proxied = false
}

resource "cloudflare_record" "_223n_tech_blog_ns_primary" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  type    = "NS"
  name    = "blog"
  value   = "ns1.dns.ne.jp"
}

resource "cloudflare_record" "_223n_tech_blog_ns_secondary" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  type    = "NS"
  name    = "blog"
  value   = "ns2.dns.ne.jp"
}

resource "cloudflare_record" "_223n_tech_issue" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  type    = "CAA"
  name    = "@"
  data {
                flags  = "0"
                tag    = "issue"
                value  = "letsencrypt.org"
  }
}

resource "cloudflare_record" "_223n_tech_issuewild" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  type    = "CAA"
  name    = "@"
  data {
                flags  = "0"
                tag    = "issuewild"
                value  = "letsencrypt.org"
  }
}

resource "cloudflare_record" "_223n_tech_iodef" {
  zone_id  = var.CLOUDFLARE_ZONE_ID
  type    = "CAA"
  name    = "@"
  data {
                flags  = "0"
                tag    = "iodef"
                value  = "223n@223n.tech"
  }
}
