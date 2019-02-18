variable "name" {
  type = "string"
}

variable "schedule_expression" {
  type    = "string"
  default = "rate(1 day)"
}

variable "cluster_arn" {
  type = "string"
}

variable "role_arn" {
  type = "string"
}

variable "task_count" {
  type    = "string"
  default = "1"
}

variable "task_def_arn" {
  type = "string"
}