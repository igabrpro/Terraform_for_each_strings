variable "vpc" {
  type        = set(string)
  description = "list of subnets"
  default = [
    "10.0.0.0/16",
    "10.1.0.0/16",
  ]
}