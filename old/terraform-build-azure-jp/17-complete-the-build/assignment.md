---
slug: complete-the-build
id: y45e9fd2x6gx
type: challenge
title: "\U0001F3D7️ インフラを構築する"
teaser: Terraformは、リソースグループから仮想ネットワーク、VM、コンテナまで、あらゆるものを立ち上げることができます。
notes:
- type: text
  contents: -auto-approveフラグを使うと、適用や破棄の前に表示される "Are you sure?"の質問をスキップすることができます。注意して使用してください!
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
残りのすべてのTerraformコードは、**main.tf**ファイルのコメントを外しています。何が構築されるかは `terraform plan` を実行して確認してください。

**outputs.tfのコメントも外し、以下のようにしてください。**

```
# Outputs file
output "catapp_url" {
  value = "http://${azurerm_public_ip.catapp-pip.fqdn}"
}
```

それでは`plan`を実行してください。

```
terraform plan
```

HashiCatアプリケーションをビルドするためにアプリケーションを実行します。

```
terraform apply -auto-approve
```

アプリケーションのデプロイが完了するまでには、最大5分かかることがあります。実行の最後にアプリケーションのURLが表示されれば、デプロイが完了したことがわかります。

新しいブラウザタブでWebアプリケーションを開きます。URLをコピーしてアドレスバーに貼り付ける必要があります。

もし、お使いのブラウザでVS codeのターミナルのコピーができない方は、別のShellタブを開いていただき、以下のコマンドを実行してコピーしてください。

```
terraform output
```