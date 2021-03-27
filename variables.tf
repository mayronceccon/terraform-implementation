variable "prefix" {
  description = "Prefix"
}

variable "node_env" {
  description = "Node ENV"
}

variable "container_image" {
  description = "Container Image"
}

variable "container_port" {
  description = "Container port"
  default = 3000
}

variable "request_memory" {
  description = "Request memory"
}

variable "request_cpu" {
  description = "Request CPU"
}

variable "limits_memory" {
  description = "Limits memory"
}

variable "limits_cpu" {
  description = "Request CPU"
}

variable "replicas" {
  description = "Replicas"
  default = 2
}

variable "min_replicas" {
  description = "Min replicas"
  default = 2
}

variable "max_replicas" {
  description = "Max replicas"
  default = 3
}

variable "cpu_average_utilization" {
  description = "CPU average utilization"
  default = 50
}