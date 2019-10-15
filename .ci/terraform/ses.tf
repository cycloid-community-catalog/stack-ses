module "ses" {
  #####################################
  # Do not modify the following lines #
  source      = "./module-ses"
  project     = var.project
  env         = var.env
  customer    = var.customer
  #####################################

  #. aws_region: us-east-1
  #+ Name of the region where the infrastructure is created
  aws_region = var.aws_region

  #. vpc_id (required):
  #+ Amazon VPC id on which create each components.
  vpc_id                   = "<vpc-id>"

  #. mail_domain (required):
  #+ Domain used for emailing
  mail_domain = "example.com"

  #. create_sqs (optional, bool): false
  #+ If you need to create a sqs (for example used for bounce emails)
  create_sqs = true

  #. create_elasticache (optional, bool): false
  #+ If you need to create an elasticache (for example used for sending/queing emails)
  create_elasticache = true

  #. elasticache_security_groups (optional, list): []
  #+ Those security groups will be granted access to the elasticache cluster

  #. elasticache_subnet_group_name (optional): redis
  #+ Name of an Amazon elasticache subnet group to use

  #. elasticache_type (optional): cache.t2.micro
  #+ Instance type to use for the elasticache cluster

}

# If you desire create a R53 record for the redis
# resource "aws_route53_record" "redis" {
#   zone_id = "xxxx"
#   name    = "xxxx"
#   type    = "CNAME"
#   ttl     = "3600"
#   records = ["${modue.ses.elasticache_endpoint}"]
# }
