---
slug: complete-the-build
id: 13bcwpn6z0fp
type: challenge
title: "\U0001F3D7️ Complete the Build"
teaser: |
  Terraform は、VPC から仮想ネットワーク、VM やコンテナまで、あらゆるものを立ち上げることができます。
notes:
- type: text
  contents: フラグ `-auto-approve` は、`apply` や `destroy` の前に表示される "Are you sure?" を表示せずに、Terraform
    の処理を行う事が出来ます。利用する際は注意してください。
tabs:
- title: Shell
  type: terminal
  hostname: workstation
- title: Code Editor
  type: code
  hostname: workstation
  path: /root/hashicat-aws
difficulty: basic
timelimit: 1000
---
Terraform の残りのコードを `main.tf` ファイルからアンコメントしました。`terraform plan` を実行して、何がビルドされるかを確認します。

```
terraform plan
```

HashiCat アプリケーションをビルドするために、`terraform apply` を実行します。

```
terraform apply -auto-approve
```

アプリケーションのデプロイが完了するまで、最大で5分かかることがあります。Terraform の出力にアプリケーションの URL が表示されれば完了です。

もしアプリケーションがロードされない場合は、もう一度 `terraform apply` を実行してください。これは Web サーバの再インストールを試み、アプリケーションが動作していない場合は起動します。

出力された `catapp_url` の URL をクリックして、新しいブラウザのタブで Web アプリケーションを開いてください。