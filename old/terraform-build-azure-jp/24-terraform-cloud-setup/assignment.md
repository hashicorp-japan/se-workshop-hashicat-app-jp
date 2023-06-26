---
slug: terraform-cloud-setup
id: hhix2tlxnydl
type: challenge
title: ☁️ Terraform Cloud
teaser: Terraform Cloudは、ユーザーに無制限の無料Terraformステート・ストレージを提供します。 ステートファイルをTerraform
  Cloudにリモートで保存することで、ステートファイルを保護することができます。
notes:
- type: text
  contents: Terraform Cloudリモートステートストレージは、すべてのユーザーが無料で利用できます。
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
このチャレンジと次のチャレンジでは、Terraform Cloud のリモートステート機能を使用して、ステートファイルをクラウドに保存します。これを行うには、Terraform Cloudのアカウントが必要です。アカウントをお持ちでない方は、以下のURLをクリックして、無料のアカウントにサインアップしてください。

https://app.terraform.io/signup/account

すでにアカウントをお持ちの場合は、既存の認証情報を使ってサインインしてください。

Terraform Cloudにサインインしたら、YOURNAME-trainingという名前の新しいOrganizationを作成します。YOURNAMEを自分の名前やその他のテキストに置き換えてください。

次に、ワークスペースの作成を求められます。「CLI-driven workflow」を選択することで、VCSとのインテグレーションステップをスキップすることができます。ワークスペースに **hashicat-azure** という名前を付けます。

ワークスペースの **Settings >> General** 設定ページに移動し、実行モードをローカルに変更します。必ず設定を保存してください。これでワークステーションからローカル変数を使ってTerraformコマンドを実行できるようになります。