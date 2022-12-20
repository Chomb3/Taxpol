resource "google_data_catalog_policy_tag" "basic_policy_tag" {
  provider = google-beta
  taxonomy = var.dpname
  #display_name = var.taxonomies
  display_name = var.policies
  description = var.description
}

resource "google_bigquery_datapolicy_data_policy" "data_policy" {
    provider = google-beta
    project  = var.project_id
    location         = var.location
    #data_policy_id   = "${var.policies}_policytag"
    data_policy_id = var.taxid
    policy_tag       = google_data_catalog_policy_tag.basic_policy_tag.id
    data_policy_type = "DATA_MASKING_POLICY"
    data_masking_policy {
      predefined_expression = "ALWAYS_NULL"
    }

      // depends_on to avoid concurrent delete issues
   depends_on = [google_data_catalog_policy_tag.basic_policy_tag]
}

##resource "google_data_catalog_policy_tag" "child_policy" {
  ##provider = google-beta
  ##taxonomy = var.taxid
  ##display_name = "${var.taxonomies}_child"
  ##description = "Child Policy Tag"
  ##parent_policy_tag = google_data_catalog_policy_tag.basic_policy_tag.id
##}