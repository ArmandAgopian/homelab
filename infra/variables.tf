variable "PM_API_URL" {
    type = string
}

variable "PM_API_TOKEN_ID" {
    type = string
}

variable "PM_API_TOKEN_SECRET" {
    type = string
    sensitive = true
}

variable "SSH_PUBLIC_KEYS" {
    type = string
    sensitive = true
}