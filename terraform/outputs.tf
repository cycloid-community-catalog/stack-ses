# SES iam
output "iam_ses_key" {
  value = "${module.ses.iam_ses_key}"
}

output "iam_ses_secret" {
  value = "${module.ses.iam_ses_secret}"
}

output "iam_ses_smtp_user_key" {
  value = "${module.ses.iam_ses_smtp_user_key}"
}

output "iam_ses_smtp_user_secret" {
  value = "${module.ses.iam_ses_smtp_user_secret}"
}

# sqs
output "aws_sqs_queue_url" {
  value = "${module.ses.aws_sqs_queue_url}"
}

# elsticache
output "elasticache_endpoint" {
  value = "${module.ses.elasticache_endpoint}"
}
