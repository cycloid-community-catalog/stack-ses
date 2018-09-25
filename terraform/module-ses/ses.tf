###
# ses
###
resource "aws_ses_domain_identity" "mail_domain" {
  domain = "${var.mail_domain}"
}

/*
resource "aws_route53_record" "mail_domain_amazonses_verification_record" {
  zone_id = "${var.zone_id}"
  name    = "_amazonses.${var.mail_domain}"
  type    = "TXT"
  ttl     = "600"
  records = ["${aws_ses_domain_identity.mail_domain.verification_token}"]
}
*/

