variable "env" {
    type = string
    default = "default"
}

variable "slack_webhook_url" {
    type = string
    default = "default"
}

variable "instance_role_enabled" {
    type = bool
    default = true
}