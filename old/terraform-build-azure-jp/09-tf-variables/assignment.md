---
slug: tf-variables
id: zb67pizjzpm0
type: challenge
title: "\U0001F39B️ Terraformの変数"
teaser: Terraform変数を使用すると、コードを書き換えずにインフラストラクチャをカスタマイズすることができます。異なる変数を使うことで同じTerraformコードを使って、開発、ステージング、本番などへのデプロイを行うことができます。
notes:
- type: text
  contents: terraform.tfvars はユーザー定義の変数の値を設定することに利用されます。
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
**terraform.tfvars** ファイルを準備しました。このファイルは、デフォルトから変更したい変数を設定するための特別なファイルです。

変数は**variables.tf**ファイルで宣言されています。これらの変数は**terraform.tfvars**ファイルで*set*または*defined*されます。

Terraformでは、すべての変数は宣言されていなければなりません（デフォルト値の有無は問いません）。

**terraform.tfvars**ファイルを開き、`prefix=`の行の行頭の#を削除し、"yourname "を自分の名前に置き換えて、プレフィックス変数を設定します。

ここで再び `terraform plan` を実行します。今回はプレフィックスが定義されているので、手動で入力する必要はありません。