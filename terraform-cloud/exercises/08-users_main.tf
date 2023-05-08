
/**** **** **** **** **** **** **** **** **** **** **** ****
 以下の権限を持つADMINSチームを設定します:

   * Manage policies 
   * Manage policy overrides
   * Workspaces
   * VCS settings
   * Run tasks
   * Private registry

**** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_team" "admins" {
  name         = "admins"
  organization = data.tfe_organization.org.name
  organization_access {
    manage_policies         = true
    manage_policy_overrides = true
    manage_workspaces       = true
    manage_vcs_settings     = true
    manage_run_tasks        = true
    manage_providers        = true // 組織のプライベートレジストリのモジュールの公開と削除をメンバーに許可する。
    manage_modules          = true // 組織のプライベートレジストリのモジュールの公開と削除をメンバーに許可する。
  }
}

/**** **** **** **** **** **** **** **** **** **** **** ****
 組織全体へのアクセス権をもたないDEVELOPERSチームを作成。
**** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_team" "developers" {
  name         = "developers"
  organization = data.tfe_organization.org.name
}

/**** **** **** **** **** **** **** **** **** **** **** ****
 組織全体へのアクセス権のないMANAGERSチームを設定します。
**** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_team" "managers" {
  name         = "managers"
  organization = data.tfe_organization.org.name
}

/**** **** **** **** **** **** **** **** **** **** **** ****
 ADMINSチームは、ADMIN アクセス権限で、hashhicatワークスペースの
 権限に関連付けます。ADMINアクセス権は、ワークスペースのフルコントロール
 が可能です:

  * All permissions of write
  * Manage team access
  * Delete workspace
  * VCS configuration
  * Execution mode
**** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_team_access" "admins" {
  access       = "admin"
  team_id      = tfe_team.admins.id
  workspace_id = tfe_workspace.hashicat.id
}

/**** **** **** **** **** **** **** **** **** **** **** ****
 HashicatのパーミッションにDEVELOPERSチームを関連付けます。
 ワークスペースにWRITEアクセス権が付与されます。読み取りアクセス権は:

  * All permissions of plan
  
    -- All permissions of read
    -- Create runs
    -- Add run comments

  * Can read and write
  * Approve runs
  * Lock/unlock workspace
  * Access to state
**** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_team_access" "developers" {
  access       = "write"
  team_id      = tfe_team.developers.id
  workspace_id = tfe_workspace.hashicat.id
}

/**** **** **** **** **** **** **** **** **** **** **** ****
 MANAGERSチームをhashhicatワークスペースのREADアクセス権に関連付けます。
 ワークスペースをReadするためのベースライン権限は次のとおりです。:

  * Read runs
  * Read variables
  * Read TF config versions
  * Read workspace information
  * Read state
**** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_team_access" "managers" {
  access       = "read"
  team_id      = tfe_team.managers.id
  workspace_id = tfe_workspace.hashicat.id
}

/**** **** **** **** **** **** **** **** **** **** **** ****
 LARS、AISHA、HIROをOrgに招待します。
**** **** **** **** **** **** **** **** **** **** **** ****/

locals {
  all_users = setunion(var.admins, var.developers, var.managers)
}

resource "tfe_organization_membership" "all_users" {
  for_each = local.all_users

  organization = data.tfe_organization.org.name
  email        = each.value
}

# /**** **** **** **** **** **** **** **** **** **** **** ****
#  ADMINチームにLARSを追加 - workshop+lars@hashicorp.com
# **** **** **** **** **** **** **** **** **** **** **** ****/

# resource "tfe_team_members" "admins" {
#   team_id   = tfe_team.admins.id
#   usernames = ["demo-lars"]
# }

# /**** **** **** **** **** **** **** **** **** **** **** ****
#  AISHAをDEVELOPERSチームに追加 - workshop+aisha@hashicorp.com
# **** **** **** **** **** **** **** **** **** **** **** ****/

# resource "tfe_team_members" "developers" {
#   team_id   = tfe_team.developers.id
#   usernames = ["demo-aisha"]
# }

# /**** **** **** **** **** **** **** **** **** **** **** ****
#  HIROをMANAGERSに追加 - workshop+hiro@hashicorp.com
# **** **** **** **** **** **** **** **** **** **** **** ****/

# resource "tfe_team_members" "managers" {
#   team_id   = tfe_team.managers.id
#   usernames = ["demo-hiro"]
# }
