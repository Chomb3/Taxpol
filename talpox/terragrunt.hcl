terraform {
  /*source = "git::ssh://git@coderepocsa.appslatam.com:7999/ltmcf/${local.this.module}.git//${local.this.submodule}?ref=${local.this.version}"*/
  source = "git::ssh://git@coderepocsa.appslatam.com:7999/LTMCF/${local.this.module}.git//${local.this.submodule}?ref=${local.this.version}"
}



remote_state {
  backend = "gcs"
  config = {
    bucket  = local.bucket_tf_state
    prefix  = "${local.prefix_tf_state}/${path_relative_to_include()}"
    project = "sp-te-resman-prod"
  }
}

include {
  path = find_in_parent_folders()
}

locals {
  default_yaml_path     = find_in_parent_folders("empty.yaml")
  common_vars           = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
  this                  = yamldecode(file("${get_terragrunt_dir()}/this.yaml"))
  artifactory_base_path = "https://artifactoryrepo1.appslatam.com/artifactory/terraform-modules/terraform-google-modules"
  bucket_tf_state       = local.common_vars.environment == "prod" ? "sp-te-resman-prod-latam-productivo" : "sp-te-resman-prod-latam-noproductivo"
  prefix_tf_state       = local.common_vars.bitbucket_repo == "" ? "${local.common_vars.bitbucket_key}" : "${local.common_vars.bitbucket_key}/${local.common_vars.bitbucket_repo}"
}

inputs = merge(
  {
    location = "us"
    project = local.common_vars.project_id
    //taxonomy = dependency.taxonomy.outputs.taxonomy_id

  },
  local.common_vars,
  local.this
)

prevent_destroy = false  # Set false if you want to allow to destroy this resource
skip            = false # Set true if you want to skip making changes to this resource

/*
dependency "taxonomy" {
  config_path                             = ""
  mock_outputs_allowed_terraform_commands = ["validate", "plan"]
  mock_outputs = {
    taxonomy_id = "foo-connection"
  }
}
*/