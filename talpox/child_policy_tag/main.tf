####Acá irá lo relacionado a la child policy.
####Si solo se requiere ejecutar el child, en el this.yaml 
####hay que cambiar el submodulo

###resource "google_data_catalog_policy_tag" "child_policy" {
  ###count = length(var.policy_child_name:) > 0 ? 1 : 0
  ###count = length(var.policy_child_name:) > 0 ? 1 : 0
  ###provider = google-beta
  ###taxonomy = var.taxid
  ###display_name = var.policy_child_name
  ###description = var.child_description
  ###parent_policy_tag = google_data_catalog_policy_tag.basic_policy_tag.id 
}