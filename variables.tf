/**
 * General Variables
 */
variable "location" {
  type = string
}

variable "environment" {
  type = string
}

variable "stack_name" {
  type = string
}

/**
 * Host authentication
 */
variable "admin_user" {
  type = string
  description = "Linux Login user name"
}

variable "pub_key" {
  type = string
  description = "Linux login public key"
}
