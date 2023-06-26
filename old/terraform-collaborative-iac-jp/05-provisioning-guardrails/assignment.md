---
slug: provisioning-guardrails
id: eeyc0t6jsgcy
type: challenge
title: Provisioning Guardrails
teaser: |
  ポリシー適用の自動化 (via Sentinel)
notes:
- type: text
  contents: |-
    このチャレンジでは、`queueing` ワークスペースを利用し、複数の失敗を表示するために事前に設定されたSentinel ポリシーをいくつか紹介します。また、それらを修正します。

    また、新しいデプロイメントにかかるコストの見積もりについても見ていきます。
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
timelimit: 900
---
プロビジョニングされるものをよりよくコントロールする方法と、デプロイメントを反復する方法を紹介します。

GitLab サーバーの Sentinel ポリシーセットの例は、すでに Terraform Cloud に登録されており、すべてのワークスペースに適用されています。この中には、`require-all-resources-from-pmr.sentinel` という一つのポリシーがあり、ルート以外のモジュールはすべてプライベートモジュールレジストリ（PMR）から来ることを求め、ルートモジュールにリソースが作られないようにするものです。どのTerraform モジュールがPMR に公開されるかを制限できるので、これはTerraform Cloud に追加できる最も重要なSentinel ポリシーの1つです。

Terraform Cloud の `Settings/Policy Sets` メニューを選択して `require-all-resources-from-pmr` ポリシーセットをクリックし、このポリシーを含む Sentinel ポリシーセットの設定を見てください。

GitLab サーバーの `Security-Team/sentinel-policies/-tree/master/cloud-agnostic/pmr` フォルダー内のSentinel ポリシー自体と `sentinel.hcl` ポリシーセット定義ファイルを見てください。

以下のように、SSH ポート 22 の 0.0.0.0/0 CIDR からのイングレスアクセスをブロックするポリシーを持つ2つ目の Sentinel ポリシーセットをデプロイすることができます。
  * TFC orgの`Settings/Policy Sets` ページで、`Connect a New Policy Set` を選択します。
  * 次の画面で、`GitLab Community Edition` を選択します。
  * 次の画面で、`Security-Team/sentinel-policies` リポジトリ（プロジェクト）を選択します。
  * 新しいポリシーセットに `aws-cis-networking-deny-public-ssh-acl-rules` という名前を付け、同様の説明を使用します。
  * `More options` ドロップダウンを展開し、`Policies Path` フィールドに `aws/networking/aws-cis-4.1-networking-deny-public-ssh-acl-rules` と入力します。
  * すべてのワークスペースに適用されるポリシー(`Policies enforced on all workspaces`)のラジオボタンを選択します。
  * ポリシーセットの登録を完了するには、`Connect policy set` ボタンをクリックします。

このポリシーセットのポリシーは、ハッカーがEC2 インスタンスやその他のAWSリソースに接続するのを防ぎます。

**このポリシーを導入した場合、デモを行った後は忘れずに削除してください。**

GitLab サーバーの `Security-Team/sentinel-policies/-/tree/master/aws/networking/aws-cis-4.1-networking-deny-public-ssh-acl-rules` フォルダー内のSentinel ポリシー自体と `sentinel.hcl` ポリシーセット定義ファイルを見てください。

後でこれと同じ手順で、他のポリシーセットやポリシーを登録することができます。(GitLab のSentinel Policies プロジェクトにある他のフォルダを見てみてください)。

`hashicups-staging` または`hashicups-prod` ワークスペースで、"Actions" ドロップダウンを選択し、"Start a new plan" アイテムを選択し、"Start plan" ボタンをクリックし、新しいプランをキューに登録します。(`hashicups-dev` ワークスペースは使用しないでください。変更がなく、ポリシーのオーバーライドを実証することができないからです。)

これで、プランとコスト見積もりの後、Sentinel ポリシーの自動チェックを観察できるはずです。ポリシーは失敗しますが、実施レベルが `soft-mandatory` に設定されているので、必要であればポリシーを上書きしてプランを適用することができます。もし、どちらかのポリシーが `hard-mandatory` の実施レベルであった場合、ポリシー違反を上書きすることはできません。

これで完了です!