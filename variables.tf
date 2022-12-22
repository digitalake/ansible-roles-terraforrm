###variables.tf###

# Virtual setup machines variable
variable "vms" {
  description = "Map of vm names to configuration."
  type = map(object({
    memoryMB            = string,
    cpu                 = string,
    libvirt_volume_size = string
  }))
}

variable "ansible_user" {
  description = "User for generating Ansible-hosts"
  type        = string
}

variable "ansible_private_key_file" {
  description = "Ansible ssh-key for remote connection"
  type        = string
}

variable "vm_img_path" {
  description = "path to local iso image will be used to create vms"
  type        = string
}

