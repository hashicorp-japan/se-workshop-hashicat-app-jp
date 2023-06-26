---
slug: a-sentinel-stands-guard
id: xurxho5m0uaz
type: challenge
title: "\U0001F6E1️ Terraform Compliance with Sentinel"
teaser: |
  組織内の開発者が、適切なタグ付けをせずにクラウドリソースを構築しています。Terraform で構築されたすべての AWS インスタンスにタグ付けを強制する方法が必要です。Sentinel は Terraform のためのガバナンスエンジンです。
notes:
- type: text
  contents: "開発者はクラウドでの作業が大好きですが、時々、インスタンスに適切な請求コードや部門コードをタグ付けするのを忘れてしまうことがあります。そこで、財務部のKarenがあなたを訪ねてきました。:\n\n>\U0001F469\U0001F3FC‍\U0001F4BC\U0001F4C8
    こんにちは。先月、非常に金額の大きい AWS の請求書を受け取りましたが、このようなリソースをリクエストした部署にどうやって請求するか方法が分かりません。これを表示するためのレポートがありますが、これは全員が適切にリソースをタグ付けしないと機能しません。すべての社員がクラウドリソースに適切なタグを付けているか確認してもらえますか？"
tabs:
- title: Code Editor
  type: service
  hostname: workstation
  port: 8443
- title: Text Editor
  type: code
  hostname: workstation
  path: /root/hashicat-aws
- title: Shell
  type: terminal
  hostname: workstation
difficulty: basic
timelimit: 1800
---
このチャレンジでは、Sentinel を使用して、自分のアカウントで作成された AWS インスタンスに、正しい請求タグと部門タグを付けることを要求するルールを適用します。

### チャレンジのセットアップ

1. 以下の GitHub リポジトリのフォークを作成します。このリポジトリには、自分の Organization で使用できるいくつかの Sentinel Policy Set が含まれています。hashicat-aws レポで行ったように、画面右上の**Fork**ボタンを使用して独自のコピーを作成します。

https://github.com/hashicorp/tfc-workshops-sentinel

**注：** 2020年9月20日以前にこのリポジトリをフォークした場合は、フォークを削除して再フォークし、Sentinel v2のインポートを使用するポリシーの新しいバージョンを使用していることを確認してください。

先に進む前に、[enforce-mandatory-tags](https://github.com/hashicorp/tfc-workshops-sentinel/blob/master/aws/enforce-mandatory-tags.sentinel)ポリシーを見てください。このポリシーでは、すべての EC2 インスタンスに「Department」と「Billable」のタグが必要です。このポリシーは、[terraform-guides](https://github.com/hashicorp/terraform-guides)という別のリポジトリにあるSentinelモジュールの機能を一部使用しています。その[governance/third-generation](https://github.com/hashicorp/terraform-guides/tree/master/governance/third-generation)ディレクトリには、便利な Sentinel のポリシーや機能がたくさんあります。

2. Organization レベルで **Settings** を選択し、**Organization Settings** に入り、**Policy Sets** をクリックします。

3. **Connect a new policy set** ボタンを使用して、新しい GitHub リポジトリを Organization に連携します。リポジトリの名前は **tfc-workshops-sentinel** ですので、覚えておいてください。

4. **Description**　の下に「Sentinel Policies for our AWS resources」と入力します。

5. **More Options**　メニューで、**Policies Path**　を`/aws`に設定します。これは、Terraform Cloud　に対して、レポジトリに保存されているAWS固有のポリシーを使用するように指示する設定です。

6. 他のすべてをデフォルト設定のままにして、ページ下部の　**Connect Policy Set**　ボタンをクリックします。

これでチャレンジを開始する準備が整いました。

### チャレンジ

まず、「VCSとの連携」のチャレンジで行った変更を取り込むために、`git pull`コマンドを実行する必要があります。

```
git pull
```

次に、`main.tf` ファイルの `aws_instance` リソースに、値が `devops` の `Department` タグを追加します。

その後、以下のコマンドを実行して、フォークしたリポジトリに変更をプッシュします。

```
git add .
git commit -m "Added the first tag"
git push origin master
```

これらのコマンドの意味は、"すべての変更を加えてローカルの git レポにコミットし、それをリモートレポの master ブランチにプッシュする"というものです。なお、`git push`コマンドを実行する際には、GitHub のクレデンシャルを入力する必要があります。

`terraform plan`がTerraform Cloud 上で正常に実行されると、続いて `enforce-mandatory-tags.sentinel` ポリシーに対する Sentinel ポリシーチェックが行われます。`aws_instance` リソースに `Billable` タグを(意図的に)まだ追加していないため、このポリシーは失敗します。その結果、Runを適用することはできません。

ここで、`main.tf` ファイルの`aws_instance` リソースに`Billable`タグに対する値を`true`として追加し、以下のコマンドを実行してリポジトリに変更をプッシュします。

```
git add .
git commit -m "Added the second tag"
git push origin master
```

今回は、EC2インスタンスが両方のタグを持つようになったので、Sentinel ポリシーはパスするはずです。

変更を master にプッシュするたびに、新しい Terraform のRunが始まります。Sentinel ポリシーのチェックを通過するまで続けてみましょう。