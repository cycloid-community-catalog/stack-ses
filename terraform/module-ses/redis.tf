resource "aws_security_group" "redis" {
  count       = "${var.create_elasticache == "true" ? 1 : 0}"
  name        = "${var.project}-${var.elasticache_name}-${var.env}"
  description = "${var.elasticache_name} ${var.env} for ${var.project}"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port = "${var.elasticache_port}"
    to_port   = "${var.elasticache_port}"
    protocol  = "tcp"

    security_groups = ["${var.elasticache_security_groups}"]
  }

  tags {
    Name       = "${var.project}-${var.elasticache_name}-${var.env}"
    client     = "${var.customer}"
    env        = "${var.env}"
    project    = "${var.project}"
    role       = "${var.elasticache_name}"
    cycloid.io = "true"
  }
}

resource "aws_elasticache_replication_group" "redis-cluster" {
  count                         = "${var.create_elasticache == "true" ? 1 : 0}"
  replication_group_id          = "${var.project}-rc-${var.env}"
  replication_group_description = "Redis cluster for the SES stack"
  node_type                     = "${var.elasticache_type}"
  port                          = "${var.elasticache_port}"
  engine_version                = "${var.elasticache_engine_version}"
  parameter_group_name          = "${var.elasticache_parameter_group_name}"
  automatic_failover_enabled    = "${var.elasticache_automatic_failover_enabled}"
  security_group_ids            = ["${aws_security_group.redis.id}"]
  subnet_group_name             = "${var.elasticache_subnet_group_name}"

  cluster_mode {
    replicas_per_node_group = "${var.elasticache_replicas_per_node_group}"
    num_node_groups         = "${var.elasticache_num_node_groups}"
  }

  tags {
    Name       = "${var.project}-${var.elasticache_name}-${var.env}"
    client     = "${var.customer}"
    env        = "${var.env}"
    project    = "${var.project}"
    role       = "${var.elasticache_name}"
    cycloid.io = "true"
  }
}
