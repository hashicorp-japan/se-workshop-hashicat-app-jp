---
slug: modular-infra
id: pdhh5udanvqq
type: challenge
title: Modular Infrastructure
teaser: |
  プライベートモジュールレジストリで標準化と再利用を可能にする
notes:
- type: text
  contents: |
    HashiCupsの展開を標準化・モジュール化するために、プライベートモジュールレジストリを見直します。
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
各チームは、プライベートモジュールレジストリにアップロード可能な、いくつかの実用的なTerraform モジュールを作成しました。

これらのモジュールは、利用者がゼロからインフラを構築する際のオーバーヘッドを簡素化します。これらの標準化された(そして反復可能な!)モジュールは、Terraform の設定が社内のベストプラクティスやコンプライアンス要件に準拠していることを保証します。

モジュールレジストリに貢献するチームは以下の通りです:

 1. ネットワークチーム
 2. インフラチーム
 3. データベースチーム
 4. セキュリティチーム

以下の手順で、Terraform モジュールをTerraform Cloud のOrganization の Private Module Registry に公開し、その中でそれらを使用する `hashicups-module` ワークスペースを作成・適用してください。
```
cd /root/setup/terraform/tfc-registry
terraform init
terraform apply -auto-approve
```

検証手順:

 1. Terraform Cloud のレジストリページにアクセスし、アプリケーションモジュールが GitLab からプライベートモジュールレジストリにパブリッシュされていることを確認します。
 2. ワークスペース `hashicups-module` が作成されていることを確認します。

  最後に、`hashicups-module` ワークスペースにアクセスし、"Queue plan manually" ボタンをクリックして、実行をトリガーします。また、必要であれば、実行を適用することもできます。