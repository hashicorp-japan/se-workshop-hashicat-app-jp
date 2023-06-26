---
slug: controlling-costs
id: ryceprt8hw2x
type: challenge
title: $ Controlling Costs with Cost Estimation
teaser: |
  あなたの組織では、開発者が大規模な VM を実行しており、多くのコストがかかっています。各ワークスペースのコストを制限する方法が必要です。
notes:
- type: text
  contents: "開発者は、本当に必要以上に大きな VM を動かすことがよくあります。財務担当の Karen が、何か良い方法がないか、あなた訪ねてきました。\n\n>\U0001F469\U0001F3FC‍\U0001F4BC\U0001F4C8
    こんにちわ、SysAdmin さん、Terraform Cloud を使用している開発者に、Terraform Run を適用する前にワークスペースの推定月額費用を知らせてほしいのです。可能でしょうか?"
- type: text
  contents: |-
    Terraform Cloud のコスト見積もり機能については、以下のリンクで詳しく解説しています。:

    [Cost Estimation in Terraform Cloud](https://www.terraform.io/docs/cloud/cost-estimation/index.html)
- type: text
  contents: |-
    なお、Sentinel は、月々の推定コストやその増加分が高すぎる場合、Terraform Run を適用しないようにすることができます。

    次の Sentinel ポリシーの例を参照してください:
      * [limit-proposed-monthly-cost.sentinel](https://github.com/hashicorp/terraform-sentinel-policies/blob/main/cloud-agnostic/limit-proposed-monthly-cost.sentinel)
      * [limit-cost-by-workspace-name.sentinel](https://github.com/hashicorp/terraform-sentinel-policies/blob/main/cloud-agnostic/limit-cost-by-workspace-name.sentinel)
      * [limit-cost-and-percentage-increase.sentinel](https://github.com/hashicorp/terraform-sentinel-policies/blob/main/cloud-agnostic/limit-cost-and-percentage-increase.sentinel)
tabs:
- title: Shell
  type: terminal
  hostname: workstation
- title: Code Editor
  type: code
  hostname: workstation
  path: /root/hashicat-azure
difficulty: basic
timelimit: 1800
---
このチャレンジでは、Terraform Cloud の [Cost Estimation](https://www.terraform.io/docs/cloud/cost-estimation/index.html) 機能を使って、`hashhicat-azure` ワークスペースの月額コストの見積もりを開発者にお知らせします。

Step 1: Enable Cost Estimation
=============================

Terraform Cloud で Organization のすべてのワークスペースにコスト見積もり機能を有効化するのはとても簡単です。

Terraform Cloud UI の画面左側の Manage パネルにある **Settings** > **Cost estimation** ページにアクセスし、「Enable Cost Estimation for all workspaces」チェックボックスにチェックを入れるだけです。

`hashicat-azure` ワークスペースのコスト見積もりを見るには、ワークスペース画面右側にある「Actions」のドロップダウンをクリックして、「Start a new plan」を選択し、新しい Terraform Run を起動するだけです。

ワークスペースの月額の見積もりは、`hashicat-azure` ワークスペースにプロビジョニングされた `azurerm_virtual_machine` リソースのコストに基づいて表示されます。

Terraform Cloud でコスト見積もりが可能な Azure リソースの一覧は [こちら](https://www.terraform.io/docs/cloud/cost-estimation/azure.html) になります。

最後に、Sentinel の `[tfrun](https://www.terraform.io/docs/cloud/sentinel/import/tfrun.html) import` を使用すると、ワークスペースに過度の月額コストやコスト増が発生する場合に Terraform Run が適用されないようにできます。

以下の Sentinel のポリシー例を参照してください。

  * [limit-proposed-monthly-cost.sentinel](https://github.com/hashicorp/terraform-sentinel-policies/blob/main/cloud-agnostic/limit-proposed-monthly-cost.sentinel)
  * [limit-cost-by-workspace-name.sentinel](https://github.com/hashicorp/terraform-sentinel-policies/blob/main/cloud-agnostic/limit-cost-by-workspace-name.sentinel)
  * [limit-cost-and-percentage-increase.sentinel](https://github.com/hashicorp/terraform-sentinel-policies/blob/main/cloud-agnostic/limit-cost-and-percentage-increase.sentinel)