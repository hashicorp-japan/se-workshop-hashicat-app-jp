---
slug: a-sentinel-stands-guard
id: dqzzjxm3lt4y
type: challenge
title: "\U0001F6E1️ Terraform Compliance with Sentinel"
teaser: |
  あなたの組織の開発者は、適切なタグ付けをせずにクラウドリソースを構築しています。Terraform で構築されたすべての AWS インスタンスにタグ付けを強制する方法が必要です。Sentinel は Terraform 用のガバナンスエンジンです。
notes:
- type: text
  contents: "開発者はクラウドでの作業が大好きですが、時々、インスタンスに正しい請求書や部門コードをタグ付けするのを忘れてしまうことがあります。財務部の
    Karen さんが、あなたを訪ねてきました。\n\n>\U0001F469\U0001F3FC‍\U0001F4BC\U0001F4C8 こんにちは、システム管理者の方。先月、非常に大きな
    AWS の請求がありましたが、こういったものを要求した部署にどれだけ請求できるのか見当もつきません。項目を表示するためのレポートがあるのですが、これは全員が適切にリソースをタグ付けしないと機能しません。すべての社員がクラウドリソースに適切なタグを付けているか確認してもらえますか？"
tabs:
- title: Shell
  type: terminal
  hostname: workstation
- title: Code Editor
  type: code
  hostname: workstation
  path: /root/hashicat-aws
difficulty: basic
timelimit: 1800
---
このチャレンジでは、[Sentinel](https://www.terraform.io/cloud-docs/policy-enforcement/sentinel) を使用して、自分のアカウントで作成された AWS インスタンスには正しい請求先タグと部門タグが必要であるというルールを適用します。

Step 1: Fork repository
=============================

以下の GitHub リポジトリのフォークを作成します。

https://github.com/hashicorp/tfc-workshops-sentinel

このリポジトリには、自分の組織で使用できるいくつかの Sentinel Policy Set が含まれています。

hashicat-aws レポで行ったように、画面右上の **Fork** ボタンを使用して独自のコピーを作成します。

**Note:** 2020年9月20日以前にこのリポジトリをフォークした場合は、フォークを削除して再フォークし、Sentinel v2 のインポートを使用するポリシーの新しいバージョンを使用していることを確認してください。

Step 2: Cofirm sentinel policy
=============================

先に進む前に、[enforce-mandatory-tags](https://github.com/hashicorp/tfc-workshops-sentinel/blob/master/aws/enforce-mandatory-tags.sentinel) ポリシーを見てください。

https://github.com/hashicorp/tfc-workshops-sentinel/blob/master/aws/enforce-mandatory-tags.sentinel

このポリシーでは、すべての EC2 インスタンスに `Department` と `Billable` のタグが必要です。

このポリシーは、[terraform-guides](https://github.com/hashicorp/terraform-guides) という別のリポジトリにある Sentinel モジュールの機能を一部使用しています。

その [governance/third-generation](https://github.com/hashicorp/terraform-guides/tree/master/governance/third-generation) ディレクトリには、便利な Sentinel のポリシーや機能がたくさんあります。

https://github.com/hashicorp/terraform-guides/tree/master/governance/third-generation

また、ポリシーに関しては、Terraform Registry の [Policy Libraries](https://registry.terraform.io/browse/policies) でも提供しています。

https://registry.terraform.io/browse/policies

Step 3: Setup policy on Terraform Cloud
=============================

利用している Organization の **Settings** > **Integrations** の **Policy Sets** をクリックします。

**Connect a new policy set** ボタンを使用して、新しい GitHub リポジトリを Organization に接続します。

リポジトリの名前は **tfc-workshops-sentinel** ですので、覚えておいてください。

**Description** の下に「Sentinel Policies for our AWS resources」と入力します。

**More Options** メニューで、**Policies Path** を `/aws` に設定します。これは、Terraform Cloud に、レポに保存されている AWS 固有のポリシーを使用するように指示します。

他のすべてをデフォルト設定のままにして、ページ下部にある「Connect policy set」ボタンをクリックします。

これで、チャレンジを始める準備が整いました。

Step 4: Modify terraform configuration
=============================

まず、「Collaborating with VCS」の課題で行った変更を取り込むために、「Shell」タブで `git pull` コマンドを実行する必要があります。

```bash
git pull
```

次に、「Code Editor」タブを開き、`main.tf` ファイルの `aws_instance` リソースに、値が `devops` の `Department` タグを追加します。

**ファイルを修正したら、必ず保存してください。** ファイルの右隣にあるフロッピーディスクのアイコン 💾 をクリックして、ファイルを保存します。

修正した `aws_instance` リソースのコードは以下の様になります。

```hcl
resource "aws_instance" "hashicat" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.hashicat.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.hashicat.id
  vpc_security_group_ids      = [aws_security_group.hashicat.id]

  tags = {
    Name = "${var.prefix}-hashicat-instance"
    Department = "devops"
  }
}
```

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

`aws_instance` リソースに `Billable` タグを(意図的に)まだ追加していないため、このポリシーは失敗します。

その結果、Terraform Run を完了することはできません。

Step 6: Modify terraform configuration
=============================

ここで、再度「Code Editor」タブを開き、`main.tf` ファイルの `aws_instance` リソースに `Billable` タグを `true` の値で追加します。

**ファイルを修正したら、必ず保存してください。** ファイルの右隣にあるフロッピーディスクのアイコン 💾 をクリックして、ファイルを保存します。

修正した `aws_instance` リソースのコードは以下の様になります。

```hcl
resource "aws_instance" "hashicat" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.hashicat.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.hashicat.id
  vpc_security_group_ids      = [aws_security_group.hashicat.id]

  tags = {
    Name = "${var.prefix}-hashicat-instance"
    Department = "devops"
    Billable = "true"
  }
}
```

「Shell」タブで以下のコマンドを実行してリポジトリに変更をプッシュします。

```bash
git add .
git commit -m "Added the second tag"
git push origin master
```

Step 6: Confirm workflow on Terraform Cloud
=============================

今回は、EC2 インスタンスが両方のタグを持つようになったので、Sentinel ポリシーはパスするはずです。

変更を master にプッシュするたびに、新しい Terraform の実行が始まります。Sentinel ポリシーのチェックを通過するまで続けてみましょう。