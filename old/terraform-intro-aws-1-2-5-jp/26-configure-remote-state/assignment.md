---
slug: configure-remote-state
id: k6pjgqctrusl
type: challenge
title: "\U0001F39B️ Configure Remote State"
teaser: |
  `terraform` コマンドラインツールは、ステートファイルを Terraform Cloud に保存することができます。必要なのはユーザートークンだけです。
notes:
- type: text
  contents: |-
    Terraform Cloud のワークスペース設定で、**local** 実行モードを指定した場合、Terraform のコマンドと変数は全てあなたのワークステーションに残ります。

    一方、**remote** 実行モードを指定した場合、Terraform は Terraform Cloud 上のワーカーで実行されます。この場合、すべての変数を Terraform Cloud で設定する必要があります。
tabs:
- title: Shell
  type: terminal
  hostname: workstation
- title: Code Editor
  type: code
  hostname: workstation
  path: /root/hashicat-aws
- title: Credentials File
  type: code
  hostname: workstation
  path: /root/.terraform.d/credentials.tfrc.json
difficulty: basic
timelimit: 1000
---
このチャレンジでは、Terraform Cloud をリモートステートバックエンドとして設定し、既存のステートファイルを Terraform Cloud にマイグレーションします。

`remote_backend.tf` ファイルを編集し、`YOURORGANIZATION` プレースホルダーをあなたの Org 名で置き換えます。**必ずファイルを保存してください。**

ワークステーションで使用する新しい **ユーザートークン** を生成しましょう。Terraform Cloud の **User Settings > Tokens** ページにアクセスします。

https://app.terraform.io/app/settings/tokens

**Create an API token** ボタンをクリックします。トークンには好きな名前を付けることができます。マウスか小さなコピーペーストのアイコンを使って、トークン全体をコピーします。

Instruqt に戻り、API トークンを `credentials.tfrc.json` というファイルに追加する必要があります。「Credentials File」タブを選択し、 `/root/.terraform.d/credentials.tfrc.json` ファイルを直接開いてください。

`YOURTOKEN` と書かれている部分を、Terraform Cloud からコピーした文字列に置き換えます。**必ずファイルを保存してください。**

これで、トークンは `/root/.terraform.d/credentials.tfrc.json` ファイルに安全に保存されました。

`terraform init` を実行して、Terraform Cloud にステートを移行しましょう。

```
terraform init
```

Terraform Cloud にステートを移行するように促されたら `yes` と入力してください。

これで、あなたのステートファイルは Terraform Cloud に安全に保存されました。TFC UI のワークスペースの **States** タブで確認することができます。

`terraform apply -auto-approve` を実行し、ステートファイルが変更されるたびに更新されるのを確認しましょう。Terraform Cloud の UI から、ワークスペース毎に管理されている以前のステートファイルを履歴として参照することができます。