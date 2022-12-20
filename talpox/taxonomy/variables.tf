variable "project_id" {}

variable "taxonomy" {
  default     = ""
  description = "Test"
  type        = string
}

##variable "taxonomies" {
##description = "Catalog Taxonomies For Policy Tags"
##default     = []
##type = list(object({
##display_name           = string,
##region                 = string,
##description            = string,
##taxonomy               = string,
##activated_policy_types = list(string),
##policy_tags = list(object({
##name        = string,
##description = string,
##child_policy_tag = list(object({
##name        = string,
##description = string,
##}))
##}))
##}))
##}

variable "taxonomies" {
  description = "Catalog Taxonomies For Policy Tags"
  default     = []
  type = list(object({
    display_name           = string,
    region                 = string,
    description            = string,
    taxonomy               = string,
    activated_policy_types = set(string),
    })
  )
}

variable "display_name" {
  default     = ""
  description = "Disp Name"
  type        = string
}

variable "dpname" {
  default     = ""
  description = "Disp Name"
  type        = string
}

variable "region" {
  default     = ""
  description = "region's Description."
  type        = string
}

variable "description" {
  default     = ""
  description = "Descriptionn"
  type        = string
}

variable "taxid" {
  default     = ""
  description = "Taxonomy ID"
  type        = string
}

variable "activated_policy_types" {
  default     = ["FINE_GRAINED_ACCESS_CONTROL"]
  description = "No se que es"
  type        = list(string)
}

variable "location" {
  default     = ""
  description = "Environment's Description."
  type        = string
}

variable "policies" {
  description = "Policies"
  default     = []
  type = list(object({
    display_name       = string,
    policy_description = string,
    })
  )
}