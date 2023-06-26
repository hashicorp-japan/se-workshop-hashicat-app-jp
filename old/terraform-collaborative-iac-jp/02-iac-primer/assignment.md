---
slug: iac-primer
id: xlcj3hqasdil
type: challenge
title: Infrastructure-as-Code (IaC) Primer
teaser: |
  コードによるインフラ管理（ステート管理、バージョン管理、コラボレーションなど）。
notes:
- type: text
  contents: |-
    Infrastructure as Code のコンセプトを理解し、ステート管理と再利用性を利用して、前回のチャレンジであった制約を克服しましょう。

    Git のようなバージョン管理システム（VCS）とどのように統合するか、どのようにインフラストラクチャを宣言するか、イミュータブルなインフラストラクチャとはどういうものか、などなど。

    まず、Terraform OSS を使って "ゼロから" インフラをプロビジョニングし、アウトプットを示し、さらに反復する方法を探ります。
tabs:
- title: Terminal
  type: terminal
  hostname: terraform
- title: Code Editor
  type: service
  hostname: terraform
  port: 8443
- title: Terraform Cloud
  type: external
  url: https://app.terraform.io
- title: Slides
  type: website
  url: https://hashicorp.github.io/field-demos-terraform-land-team-Apollo-11/#1
difficulty: basic
timelimit: 1800
---
ここで行う事は、Infrastructure-as-Code の入門編になります。Terraform OSS とローカルステートを使って、HashiCups アプリケーションをデプロイします。左側のウィンドウに、「Terminal」タブと「Code Editor」タブが表示されています。「Code Editor」タブに移動し、様々なファイルを確認し、HashiCorp Configuration Language (HCL) の構文に慣れるようにします。

`main.tf` が何をするのか、また`variables.tf` と`output.tf` の内容も理解しましょう。

ここから、`terraform init`、`terraform plan`、`terraform apply`を実行し、インフラ全体のプロビジョニングを開始します。

以下のコマンドを実行して下さい。:
```
cd /root/gitclones/hashicups-application
terraform init
terraform plan
terraform apply
```

インフラストラクチャのプロビジョニングが完了したので、デプロイされたアプリを見てみましょう。出力されたリンクをコピーして、Webブラウザーのタブに貼り付けて、すべてがうまくいくことを確認してください。

注意すべき重要な点は、最新の `terraform apply` によって提供されるデータです。デプロイされたアプリの出力データを見るには、`terraform output` を使ってください。

環境変数を確認し、`env | grep AWS` コマンドを使用し、どのようにAWS に接続したかを確認します。

このTerraform のコードの多くは重要ですが(特に後述)、Terraform の実行を成功させるために全てを含める必要は **ありません** 。

最後に、ステートファイル `terraform.tfstate` を `terraform show` コマンドで見てみましょう。チームでTerraform を使う場合、ローカルファイルを使うとTerraform の利用が複雑になります。各ユーザーは、Terraform を実行する前に常に最新のステートファイルを取得し、同時に誰もTerraform を実行していないことを確認しなければならないからです。

また、ステートは安全に保管されるべき機密情報を保持することができます。例えば、ステートの中に含まれている機密情報として、秘密鍵の情報があります。

次のチャレンジでは、Terraform のステートを **リモートで** 処理する方法を探ります。