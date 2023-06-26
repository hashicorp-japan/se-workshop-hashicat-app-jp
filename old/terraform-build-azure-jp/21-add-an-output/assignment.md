---
slug: add-an-output
id: yhdolkgc9xp8
type: challenge
title: "\U0001F5A8️ Outputを追加する"
teaser: Outputは、IPアドレスやアプリケーションURLなどの有用な情報を取得するために使用されます。
notes:
- type: text
  contents: Outputには、Terraformデータとプレーンテキストを混在させることができます。Outputは、applyの最後にユーザーに有益な情報を伝えるために使用することができます。
- type: text
  contents: terraform refresh コマンドは、インフラに存在するものとステートファイルを同期させます。refresh コマンドはインフラを変更しません。
- type: text
  contents: terraform output コマンドは、Terraform のoutputをもう一度見たいときにいつでも実行することができます。1つの出力を表示するには、`terraform
    output <output_name>` を実行してください。
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
コードエディタで **outputs.tf** ファイルを開きます。

ウェブサーバの `ip_address` を出力するための2つ目の出力を追加します。最初の出力とほぼ同じですが、DNS名の代わりにIPアドレスを出力します。

出力の名前は `catapp_ip` とします。

```
output "catapp_ip" {
  value = azurerm_public_ip.catapp-pip.ip_address
}
```

どのような出力が可能かについては、ドキュメントページを参照してください。

[Terraform Azure Docs - Click Here](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) <br>
[Terraform Outputs Docs - Click Here] (https://www.terraform.io/docs/configuration/outputs.html)

terraform refreshコマンドを実行し、Stateファイルを更新します。すると、新しい出力が表示されます。

```
terraform refresh
```

Terraform outputコマンドを実行すると、いつでもすべてのOutputを見ることができます。

```
terraform output
```