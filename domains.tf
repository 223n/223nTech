resource cloudflare_page_rule "223n_tech_rule" {
  "zone"     = "223n.tech"
  "target"   = "blog.223n.tech/*"
  "priority" = 1

  "actions" = {
    "ssl"              = "strict"
    "always_use_https" = true
  }
}

resource cloudflare_zone_settings_override "223n_tech_setting" {
  name = "223n.tech"

  settings {
    ipv6             = "on"
    ssl              = "strict"
    always_use_https = "on"
  }
}

resource cloudflare_record "223n_tech_mx1" {
  "domain"   = "223n.tech"
  "value"    = "aspmx.l.google.com"
  "type"     = "MX"
  "proxied"  = false
  "name"     = "@"
  "priority" = 1
}

resource cloudflare_record "223n_tech_mx2" {
  "domain"   = "223n.tech"
  "value"    = "alt1.aspmx.l.google.com"
  "type"     = "MX"
  "proxied"  = false
  "name"     = "@"
  "priority" = 5
}

resource cloudflare_record "223n_tech_mx3" {
  "domain"   = "223n.tech"
  "value"    = "alt2.aspmx.l.google.com"
  "type"     = "MX"
  "proxied"  = false
  "name"     = "@"
  "priority" = 5
}

resource cloudflare_record "223n_tech_mx4" {
  "domain"   = "223n.tech"
  "value"    = "alt3.aspmx.l.google.com"
  "type"     = "MX"
  "proxied"  = false
  "name"     = "@"
  "priority" = 10
}

resource cloudflare_record "223n_tech_mx5" {
  "domain"   = "223n.tech"
  "value"    = "alt4.aspmx.l.google.com"
  "type"     = "MX"
  "proxied"  = false
  "name"     = "@"
  "priority" = 10
}

resource cloudflare_record "223n_tech_google_site_verification" {
  "domain"  = "223n.tech"
  "value"   = "google-site-verification=j2iRgDV1dcpeEU8SJ0VYd9kTnnPGQvWTS9zJsJv9Fv0"
  "type"    = "TXT"
  "proxied" = false
  "name"    = "@"
}

resource cloudflare_record "223n_tech_spf" {
  "domain"  = "223n.tech"
  "value"   = "v=spf1 include:_spf.google.com ~all"
  "type"    = "TXT"
  "proxied" = false
  "name"    = "@"
}

resource cloudflare_record "223n_tech_dmarc" {
  "domain"  = "223n.tech"
  "value"   = "v=DMARC1; p=none; rua=mailto:223n@223n.tech"
  "type"    = "TXT"
  "proxied" = false
  "name"    = "_dmarc"
}

resource cloudflare_record "223n_tech_dkim" {
  "domain"  = "223n.tech"
  "value"   = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCe6dL29XcAvNXSODgRkeekGQu3nh3iXi0H1T9eIaXPX3GQBCmDSSwxFmhaA76BNKrpdFEpZ3CrElz92AD0tL2tdXoyPXydG+rlEsvKn+bn1WnIgL5CvjXlAARSbosINRIIXyT47m84V3CvEDq/IUx4P27jck7p5uYiFH3/Kb3evQIDAQAB"
  "type"    = "TXT"
  "proxied" = false
  "name"    = "google._domainkey"
}

resource cloudflare_record "223n_tech_blog_google_search_console" {
  "domain"  = "223n.tech"
  "value"   = "google-site-verification=j2iRgDV1dcpeEU8SJ0VYd9kTnnPGQvWTS9zJsJv9Fv0"
  "type"    = "TXT"
  "proxied" = false
  "name"    = "google_search_console"
}

resource cloudflare_record "223n_tech_blog_ns_primary" {
  "domain" = "223n.tech"
  "name"   = "blog"
  "type"   = "NS"
  "value"  = "ns1.dns.ne.jp"
}

resource cloudflare_record "223n_tech_blog_ns_secondary" {
  "domain" = "223n.tech"
  "name"   = "blog"
  "type"   = "NS"
  "value"  = "ns2.dns.ne.jp"
}
