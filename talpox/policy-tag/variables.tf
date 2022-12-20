variable "project_id" {}

variable "taxonomies" {
  default = ""
  description = "Catalog Taxonomies For Policy Tags"
  type        = string
}

variable "policies" {
  default = ""
  description = "Policy Tags"
  type        = string
}

variable "description" {
  default = ""
  description = "Descriptionn"
  type        = string
}

variable "dpname" {
  default     = ""
  description = "Disp Name"
  type        = string
}


variable "taxid" {
  default = ""
  description = "Taxonomy ID"
  type        = string
}

variable "policy_description" {
  default = ""
  description = "Policy Tag Description"
  type        = string
}

variable "policy_name" {
  default = ""
  description = "Policy Tag Name"
  type        = string
}

variable "location" {
  default = ""
  description = "Environment's Description."
  type        = string
}

variable "mask_policy" {
  type = string
  default = "SHA256" 
}