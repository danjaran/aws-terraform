variable "redis_name_cluster" {
}
variable "instance_type" {
  default = "cache.t3.micro"
}
variable "number_nodes" {
}
variable "parameter_group_name" {
  default = "default.redis6.2"
}
variable "redis_version" {
  default = "6.2"
}