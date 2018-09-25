variable "aws_region" {
  default = "eu-west-1"
}

variable "env" {}
variable "customer" {}

variable "project" {
  default = "ses"
}

###
# ses
###

#verified domain used to send email
variable "mail_domain" {}

###
# sns
###
variable "create_sqs" {
  description = "**true** create a sqs generaly used for bounce email"
  default     = "true"
}
