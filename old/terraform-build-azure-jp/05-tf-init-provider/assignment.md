---
slug: tf-init-provider
id: 8dlqxrlmgphi
type: challenge
title: ☁️ Terraform Init -　Azure Providerのインストール
teaser: Terraformは、クラウドAPIと対話するためのプロバイダが必要です。プロバイダはTerraformコアをインフラストラクチャ・プロバイダに接続します。
notes:
- type: text
  contents: |-
    Terraformのコアプログラムは、それだけではとくになにもしません。Terraformは、クラウドAPIと対話するために**プロバイダー**の助けを必要とします。Terraformには何百もの異なるプロバイダがあります。プロバイダのリストはこちらを参照してください。

    https://www.terraform.io/docs/providers/index.html

    今日は**azurerm**というプロバイダを使ってみます。AzureRMとは、Azure Resource Managerの略です。
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
HashiCatアプリケーション用のTerraformコードを準備しました。このソースコードはトラックの残りの部分で使用します。

Terraformを使用する前に、ワークスペースを初期化する必要があります。ターミナルウィンドウで以下のコマンドを実行してください。
```
terraform init
```
`terraform init`コマンドは、Terraformコードをスキャンし、必要なプロバイダやモジュールをダウンロードします。

ダウンロードされたプロバイダやモジュールは `.terraform` ディレクトリに保存されます。

```
ls .terraform
```