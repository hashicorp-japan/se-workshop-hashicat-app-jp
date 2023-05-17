
/**** **** **** **** **** **** **** **** **** **** **** ****
 ビジネスルールとセキュリティガイドラインをサポートするために、
 ガバナンスルールを強化するポリシーのコレクションを追加します。
**** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_sentinel_policy" "restrict-deployment-cost" {
  name         = "restrict-deployment-cost"
  description  = "Policy for HashiCat Social"
  organization = data.tfe_organization.org.name
  policy       = <<-EOS
  # このポリシーでは、開発チームの月次コスト見積もりが5ドル未満であることを要求します。
  
  import "tfrun"
  import "decimal"

  proposed_monthly_cost = decimal.new(tfrun.cost_estimate.proposed_monthly_cost)

  main = rule {
    proposed_monthly_cost.less_than(5)
  }
  EOS
  enforce_mode = "soft-mandatory"
}

/*
resource "tfe_sentinel_policy" "enforce-trusted-modules" {
  name         = "enforce-trusted-modules"
  description  = "Policy for HashiCat Social"
  organization = data.tfe_organization.org.name
  policy       = <<-EOS
  import "tfconfig/v2" as tfconfig

  param approved_version default "3.0.0"

  aws_s3_module = filter tfconfig.module_calls as _, module {
    module.name is "s3_bucket" and 
    module.source is "app.terraform.io/interrupt-software/s3-bucket/aws"
  }

  aws_s3_module_version_is_valid = rule {
    aws_s3_module.s3_bucket.version_constraint is approved_version
  }

  main = rule {
    aws_s3_module_version_is_valid
  }
  EOS
  enforce_mode = "soft-mandatory"
}
*/

/*
 * 以下のPolicyの実行には、tfplan-functions.sentinelが必要です。
 */ 
/*
resource "tfe_sentinel_policy" "enforce-mandatory-tags" {
  name         = "enforce-mandatory-tags"
  description  = "Policy for HashiCat Social"
  organization = data.tfe_organization.org.name
  policy       = <<-EOS
  # このポリシーでは、Sentinel tfplan/v2 importを使用して、
  # すべてのEC2インスタンスがタグ属性にEnvironmentキーを持ち、
  # それが許可リストに載っている値を持つことを要求します。

  # "plan" エイリアスで common-functions/tfplan-functions/tfplan-functions.sentinel
  # をインポートします。
  import "tfplan-functions" as plan

  # 必須のタグ
  mandatory_tags = ["Environment", "Department"]

  # 許可されたEnvironmentの値
  # "null"をリストに入れることで、未設定と"computed values"を許可します。
  allowed_environments = ["dev", "qa", "prod"]

  # 全てのEC2インスタンスを取得します
  allEC2Instances = plan.find_resources("aws_instance")

  # Environmentタグを持たないEC2インスタンスのみをフィルタします。
  # 最後のパラメータを"true"にすると、全ての違反事項が出力されます。
  EC2InstancesWithoutEnvironmentTag =
          plan.filter_attribute_not_contains_list(allEC2Instances,
                          "tags", mandatory_tags, true)

  # 無効なEnvironmentタグを持つEC2インスタンスをフィルタします。
  # 最後のパラメータを"true"にすると、全ての違反事項が出力されます。
  EC2InstancesWithInvalidEnvironmentTag = plan.filter_attribute_map_key_contains_items_not_in_list(allEC2Instances,
                          "tags", "Environment", allowed_environments, true)

  # 違反の件数をカウントします。
  violations = length(EC2InstancesWithoutEnvironmentTag["messages"]) + length(EC2InstancesWithInvalidEnvironmentTag["messages"])

  # メインルール
  main = rule {
    violations is 0
  }
  EOS
  enforce_mode = "soft-mandatory"
}
*/

resource "tfe_policy_set" "test" {
  name         = "Hashicat-Social"
  description  = "Policies for HashiCat Social"
  organization = data.tfe_organization.org.name
  policy_ids = [
    tfe_sentinel_policy.restrict-deployment-cost.id
  ]
  workspace_ids = [tfe_workspace.hashicat.id]
}

/**** **** **** **** **** **** **** **** **** **** **** ****
 以下は、VCSリポジトリに連携されたPolicy Setを作成する例です。
 ここでは利用しません。
**** **** **** **** **** **** **** **** **** **** **** ****/
/*
resource "tfe_policy_set" "test" {
  name          = "Hashicat-Social"
  description   = "Policies for HashiCat Social"
  organization  = data.tfe_organization.org.name
  policies_path = "/policies"
  workspace_ids = [tfe_workspace.hashicat.id]

  vcs_repo {
    identifier         = "${var.github_organization}/${var.github_repo}"
    branch             = "main"
    ingress_submodules = false
    oauth_token_id     = tfe_oauth_client.github.oauth_token_id
  }
}
*/