# Copyright (c) HashiCorp, Inc.

terraform {
  required_providers {
    tfe = {
      version = "~> 0.38.0"
    }
  }
}

/**** **** **** **** **** **** **** **** **** **** **** ****
参加者からターゲットとするOrg名を取得します。
**** **** **** **** **** **** **** **** **** **** **** ****/

data "tfe_organization" "org" {
  name = var.tfc_organization
}

/**** **** **** **** **** **** **** **** **** **** **** ****
 
 * 廃止予定 *
 
 ワークスペースをローカル実行モードで構成し、PlanとApplyがこの
 ワークステーション上で行われるようにします。
 Terraform CloudはStateの保存と同期にのみ使用します。

 * 廃止予定 *

**** **** **** **** **** **** **** **** **** **** **** ****/

# resource "tfe_workspace" "hashicat" {
#   name           = var.tfc_workspace
#   organization   = data.tfe_organization.org.name
#   tag_names      = var.tfc_workspace_tags
#   execution_mode = "local"
# }

/**** **** **** **** **** **** **** **** **** **** **** ****

 * 廃止予定 *

 ワークスペースをREMOTE実行モードで構成し、PlanとApplyが
 Terraform Cloudのインフラで行われるようにします。 
 Terraform Cloudがコードを実行し、Stateの保存も実施します。

* 廃止予定 *

**** **** **** **** **** **** **** **** **** **** **** ****/

# resource "tfe_workspace" "hashicat" {
#   name           = var.tfc_workspace
#   organization   = data.tfe_organization.org.name
#   tag_names      = var.tfc_workspace_tags
#   execution_mode = "remote"
# }

/**** **** **** **** **** **** **** **** **** **** **** ****
 ワークスペースをREMOTE実行モードで構成し、PlanとApplyが
 Terraform Cloudのインフラで行われるようにします。 
 Terraform Cloudがコードを実行し、Stateの保存も実施します。
**** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_workspace" "hashicat" {
  name         = var.tfc_workspace
  organization = data.tfe_organization.org.name
  tag_names    = var.tfc_workspace_tags
  auto_apply   = true

  vcs_repo {
    identifier     = "${var.github_organization}/${var.github_repo}"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

/**** **** **** **** **** **** **** **** **** **** **** ****
 Organization全体で利用可能な変数を、Variables Setsを使って設定します。
**** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_variable_set" "hashicat" {
  name         = "Cloud Credentials"
  description  = "Dedicated Principal Account for Terraform Deployments"
  organization = data.tfe_organization.org.name
}

/**** **** **** **** **** **** **** **** **** **** **** ****
 HashicatワークスペースにVariables Setsを適用する。
**** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_workspace_variable_set" "hashicat" {
  variable_set_id = tfe_variable_set.hashicat.id
  workspace_id    = tfe_workspace.hashicat.id
}

