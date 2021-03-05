
variable "environment" {
  type    = string
  description = "Environment name, e.g. 'dev' or 'prod'"
  default = "dev"
}
variable "sbname" {
  default = {
    name = "demo-queue"
  }
}

variable "funcname" {
  default = {
    name = "demo-function-terraform"
  }
}

variable "department" {
  type    = string
  description = "A sample variable passed from the build pipeline and used to tag resources."
  default = "DevOps"
}

variable "ARM_CLIENT_ID" {
  
}

variable "ARM_CLIENT_SECRET" {
  
}