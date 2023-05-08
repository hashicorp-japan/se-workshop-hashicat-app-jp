
/**** **** **** **** **** **** **** **** **** **** **** ****
 クラウド認証情報の変数セットにGOOGLE_CREDENTIALSを追加します。
**** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_variable" "google_cloud_credentials" {
  key             = "GOOGLE_CREDENTIALS"
  value           = var.google_credentials
  category        = "env"
  description     = "Google Credentials"
  variable_set_id = tfe_variable_set.hashicat.id
  sensitive       = true
}

/**** **** **** **** **** **** **** **** **** **** **** ****
 Google CloudプロジェクトIDをCloud Credentials変数セットに追加します。
**** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_variable" "google_cloud_project" {
  key             = "project"
  value           = var.project
  category        = "terraform"
  description     = "Google Cloud project ID"
  variable_set_id = tfe_variable_set.hashicat.id
  sensitive       = false
}
