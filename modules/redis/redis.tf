resource "aws_elasticache_cluster" "module_redis" {
  cluster_id           = var.redis_name_cluster
  engine               = "redis"
  node_type            = var.instance_type
  num_cache_nodes      = var.number_nodes
  parameter_group_name = var.parameter_group_name
  engine_version       = var.redis_version
  port                 = 6379
}



# resource "aws_elasticache_cluster" "module_redis" {
#   cluster_id        = "mycluster"
#   engine            = "redis"
#   node_type         = "cache.t3.micro"
#   num_cache_nodes   = 1
#   port              = 6379
#   apply_immediately = true
#   log_delivery_configuration {
#     destination      = aws_cloudwatch_log_group.example.name
#     destination_type = "cloudwatch-logs"
#     log_format       = "text"
#     log_type         = "slow-log"
#   }
#   log_delivery_configuration {
#     destination      = aws_kinesis_firehose_delivery_stream.example.name
#     destination_type = "kinesis-firehose"
#     log_format       = "json"
#     log_type         = "engine-log"
#   }
# }