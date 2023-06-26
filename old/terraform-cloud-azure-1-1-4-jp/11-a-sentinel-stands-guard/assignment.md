---
slug: a-sentinel-stands-guard
id: tzhaitcsv0bz
type: challenge
title: "\U0001F6E1️ Terraform Compliance with Sentinel"
teaser: |
  あなたの組織の開発者は、適切なタグ付けをせずにクラウドリソースを構築しています。Terraform で構築されたすべての Azure インスタンスにタグ付けを強制する方法が必要です。Sentinel は Terraform 用のガバナンスエンジンです。
notes:
- type: text
  contents: "開発者はクラウドでの作業が大好きですが、時々インスタンスに正しい請求書や部門コードをタグ付けするのを忘れてしまうことがあります。財務部の
    Karen さんが、あなたを訪ねてきました。\n\n>\U0001F469\U0001F3FC‍\U0001F4BC\U0001F4C8 こんにちは、SysAdmin
    さん。先月、非常に大きな Azure の請求がありましたが、こういったものをリクエストした部署にどれだけ請求できるのか見当もつきません。項目を表示するためのレポートがあるのですが、これは全員が適切にリソースをタグ付けしないと機能しません。すべての社員がクラウドリソースに適切なタグを付けているか確認してもらえますか？"
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
このチャレンジでは、Policy as a Code の [Sentinel](https://www.terraform.io/cloud-docs/policy-enforcement/sentinel) を使用して、自分のアカウントで作成された Azure インスタンスには正しい請求先タグと部門タグが必要であるというルールを適用します。

Step 1: Fork repository
=============================

以下の GitHub リポジトリのフォークを作成します。

https://github.com/hashicorp/tfc-workshops-sentinel

このリポジトリには、自分の組織で使用できるいくつかの Sentinel Policy Set が含まれています。

hashicat-azure レポで行ったように、画面右上の **Fork** ボタンを使用して独自のコピーを作成します。

**Note:** 2020年9月20日以前にこのリポジトリをフォークした場合は、フォークを削除して再フォークし、Sentinel v2 のインポートを使用するポリシーの新しいバージョンを使用していることを確認してください。

Step 2: Cofirm sentinel policy
=============================

先に進む前に、[enforce-mandatory-tags](https://github.com/hashicorp/tfc-workshops-sentinel/blob/master/azure/enforce-mandatory-tags.sentine) ポリシーを見てください。

このポリシーでは、すべての Azure インスタンスに `Department` と `Billable` のタグが必要です。

このポリシーは、[terraform-guides](https://github.com/hashicorp/terraform-guides) という別のリポジトリにある Sentinel モジュールの機能を一部使用しています。

その [governance/third-generation](https://github.com/hashicorp/terraform-guides/tree/master/governance/third-generation) ディレクトリには、便利な Sentinel のポリシーや機能がたくさんあります。

また、ポリシーに関しては、Terraform Registry の [Policy Libraries](https://registry.terraform.io/browse/policies) でも提供しています。

Step 3: Setup policy on Terraform Cloud
=============================

利用している Organization の **Settings** > **Integrations** の **Policy Sets** をクリックします。

**Connect a new policy set** ボタンを使用して、新しい GitHub リポジトリを Organization に接続します。

リポジトリの名前は **tfc-workshops-sentinel** ですので、覚えておいてください。

**Description** の下に「Sentinel Policies for our Azure resources」と入力します。

**More Options** メニューで、**Policies Path** を `/azure` に設定します。これは、Terraform Cloud に、レポに保存されている Azure 固有のポリシーを使用するように指示します。

他のすべてをデフォルト設定のままにして、ページ下部にある「Connect policy set」ボタンをクリックします。

これで、チャレンジを始める準備が整いました。

Step 4: Modify terraform configuration
=============================

まず、「Collaborating with VCS」の課題で行った変更を取り込むために、「Shell」タブで `git pull` コマンドを実行する必要があります。

```bash
git pull
```

次に、「Code Editor」タブを開き、`main.tf` ファイルの `azurerm_virtual_machine` リソースに、値が `devops` の `Department` タグを追加します。

```hcl
  tags = {
    Department = "devops"
  }
```

**ファイルを修正したら、必ず保存してください。** ファイルの右隣にあるフロッピーディスクのアイコン 💾 をクリックして、ファイルを保存します。

その後、「Shell」タブで以下のコマンドを実行して、フォークしたリポジトリに変更をプッシュします。

```bash
git add .
git commit -m "Added the first tag"
git push origin master
```

これらのコマンドの意味は、"すべての変更を加えてローカルの git レポにコミットし、それをリモートレポの master ブランチにプッシュする” というものです。

なお、`git push` コマンドを実行する際には、GitHub のクレデンシャル（GitHub のユーザー名と個人用アクセストークン）を入力する必要があります。

Step 5: Confirm policy enforcement on Terraform Cloud
=============================

Terraform Cloud 上でプランが正常に実行されると、続いて `enforce-mandatory-tags.sentinel` ポリシーに対する Sentinel ポリシーチェックが行われます。

`azurerm_virtual_machine` リソースに `Billable` タグを(意図的に)まだ追加していないため、このポリシーは失敗します。

その結果、Terraform Run を完了することはできません。

Step 6: Modify terraform configuration
=============================

ここで、再度「Code Editor」タブを開き、`main.tf` ファイルの `azurerm_virtual_machine` リソースに `Billable` タグを `true` の値で追加します。

```hcl
  tags = {
    Department = "devops"
    Billable = "true"
  }
```

**ファイルを修正したら、必ず保存してください。** ファイルの右隣にあるフロッピーディスクのアイコン 💾 をクリックして、ファイルを保存します。

「Shell」タブで以下のコマンドを実行してリポジトリに変更をプッシュします。

```bash
git add .
git commit -m "Added the second tag"
git push origin master
```

Step 6: Confirm workflow on Terraform Cloud
=============================

今回は、Azure VM が両方のタグを持つようになったので、Sentinel ポリシーはパスするはずです。

変更を master にプッシュするたびに、新しい Terraform Run が始まります。Sentinel ポリシーのチェックを通過するまで続けてみましょう。