
/**** **** **** **** **** **** **** **** **** **** **** ****
 デプロイのためのTerraform Providerを指定します。 
 例えば: 公開Terraform Registryにある"aws_s3", "Azure Blob Storage",
 "Google Cloud Storage" モジュールのようなものです。
**** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_registry_module" "STORAGE_MODULE" {
  vcs_repo {
    display_identifier = "${var.github_organization}/${var.module_repo}"
    identifier         = "${var.github_organization}/${var.module_repo}"
    oauth_token_id     = tfe_oauth_client.github.oauth_token_id
  }
}
