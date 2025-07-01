variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "public_key" {
  description = "Public key material"
  type        = string
}

variable "tags" {
  description = "Additional tags for the key pair"
  type        = map(string)
  default     = {}
}