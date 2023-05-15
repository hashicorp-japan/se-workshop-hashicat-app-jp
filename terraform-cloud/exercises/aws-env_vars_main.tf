
/**** **** **** **** **** **** **** **** **** **** **** ****
 AWS_ACCESS_KEY_ID を Cloud Credentials 変数セットに追加します。
**** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_variable" "aws_access_key_id" {
  key             = "AWS_ACCESS_KEY_ID"
  value           = var.instruqt_aws_access_key_id
  category        = "env"
  description     = "AWS access key"
  variable_set_id = tfe_variable_set.hashicat.id
  sensitive       = true
}

/**** **** **** **** **** **** **** **** **** **** **** ****
 AWS_SECRET_ACCESS_KEY を Cloud Credentials 変数セットに追加します。
**** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_variable" "aws_secret_access_key" {
  key             = "AWS_SECRET_ACCESS_KEY"
  value           = var.instruqt_aws_secret_access_key
  category        = "env"
  description     = "AWS secret key"
  variable_set_id = tfe_variable_set.hashicat.id
  sensitive       = true
}
