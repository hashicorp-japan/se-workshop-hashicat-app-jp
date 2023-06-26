---
slug: add-a-tag
id: zqqyq6q8rxlv
type: challenge
title: "\U0001F3F7️ Resource にTagを追加する"
teaser: Terraformでは、その場にあるいくつかのリソースを削除せずに変更することができます。例えばTagの追加はリソースの削除は行いません。
notes:
- type: text
  contents: Tagの追加などリソースの再生成が必要ない場合もあります。
tabs:
- title: Code Editor
  type: service
  hostname: workstation
  port: 8443
- title: Text Editor
  type: code
  hostname: workstation
  path: /root/hashicat-azure
- title: Shell
  type: terminal
  hostname: workstation
difficulty: basic
timelimit: 1000
---
azurerm_resource_groupリソースのTerraformドキュメントを参考にしてTagを追加するコードを追記してみてください。

[Azure Terraform Docs - ここから開く](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)

**main.tf**ファイルのResource groupにtagを追加します。

```
tags = {
  environment = "Production"
}
```

タグの名前は `environment` で、値は `Production` と入れてください。tagは大文字と小文字を区別します。大文字のPを使うようにしてください。

`terraform plan`を再実行してください。

Plan結果を見ると、Resourceの再作成は行われず、更新だけとなります。

それでは、Applyしてみてください。

```
terraform apply -auto-approve
```