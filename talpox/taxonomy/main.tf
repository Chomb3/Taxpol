locals {
  taxonomies = { for taxonomy in var.taxonomies : taxonomy["display_name"] => taxonomy }
  policies   = { for policy in var.policies : policy["display_name"] => policy }
}

data "google_iam_policy" "masked-reader" {
  provider = google-beta
  binding {
    role = "roles/viewer"
    members = [
      "user:camiloortega.globant@latam.com"
    ]
  }
}

resource "google_data_catalog_taxonomy" "basic_taxonomy" {
  for_each = local.taxonomies
  provider = google-beta
  project  = var.project_id
  #display_name           = "${each.key}-taxonomy"
  display_name           = each.key
  region                 = each.value["region"]
  description            = each.value["description"]
  activated_policy_types = each.value["activated_policy_types"]
}

resource "google_data_catalog_taxonomy_iam_policy" "policy" {
  for_each = google_data_catalog_taxonomy.basic_taxonomy
  provider = google-beta
  project  = var.project_id
  #taxonomy = each.value.id
  taxonomy    = google_data_catalog_taxonomy.basic_taxonomy[each.key].id
  policy_data = data.google_iam_policy.masked-reader.policy_data
  // depends_on to avoid concurrent delete issues
  depends_on = [google_data_catalog_taxonomy.basic_taxonomy]
}

module "policytag" {
  source = "../policy-tag"
  #for_each = toset(["local.taxonomies", "local.policies"])
  for_each = local.policies
  #for_each   = local.policies
  project_id = var.project_id
  #taxonomies  = each.key
  #taxid       = google_data_catalog_taxonomy.basic_taxonomy[].id
  taxid       = var.taxonomy
  dpname      = var.display_name
  location    = var.region
  description = var.description
  policies    = each.key
}