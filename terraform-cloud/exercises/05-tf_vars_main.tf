
/**** **** **** **** **** **** **** **** **** **** **** ****
 hashhicatのワークスペース変数にPREFIXを追加する。
**** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_variable" "prefix" {
  key          = "prefix"
  value        = var.prefix
  category     = "terraform"
  description  = "Hashicat deployment prefix"
  workspace_id = tfe_workspace.hashicat.id
}

/**** **** **** **** **** **** **** **** **** **** **** ****
 hashhicatのワークスペース変数にREGIONを追加する。
**** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_variable" "region" {
  key          = "region"
  value        = var.region
  category     = "terraform"
  description  = "Cloud region"
  workspace_id = tfe_workspace.hashicat.id
}
