---
slug: terraform-cloud-setup
id: kgzyeqtgmzr3
type: challenge
title: ☁️ Terraform Cloud Setup
teaser: |
  Terraform Cloud は、ユーザー向けに Terraform のステートストレージを無制限に無料で提供しています。Terraform Cloud にリモートで保存することで、ステートファイルを安全に保護します。
notes:
- type: text
  contents: Terraform Cloud のリモートステートストレージは、すべてのユーザーが無料で利用できます。
tabs:
- title: Shell
  type: terminal
  hostname: workstation
- title: Code Editor
  type: code
  hostname: workstation
  path: /root/hashicat-aws
difficulty: basic
timelimit: 1000
---
今回のチャレンジと次のチャレンジでは、Terraform Cloud のリモートステート機能を使って、ステートファイルをクラウドに保存します。これを行うには、Terraform Cloud のアカウントが必要です。以下の URL をクリックして、まだお持ちでない方は無料アカウントにサインアップしてください。

https://app.terraform.io/signup/account

すでにアカウントをお持ちの方は、既存の認証情報でサインインするだけです。

Terraform Cloud にサインインしたら、`YOURNAME-training` という新しい Org を作成します。`YOURNAME` は自分の名前や他のテキストに置き換えてください。

次にワークスペースを作成するプロンプトが表示されます。`CLI-driven workflow` パネルをクリックすることで、VCS 連携のステップをスキップすることができます。ワークスペースに `hashicat-aws` という名前を付けてください。

**Note:** 既に `hashicat-aws` ワークスペースがある場合、 **Settings >> Destruction and Deletion** メニューを選択し、"Delete from Terraform Cloud" ボタンをクリック、確認のため "hashicat-aws" と入力し、"Delete workspace" ボタンをクリックし、ワークスペースを削除してください。その後、上記のように再作成してください。こうすることで、リモートで実行した後にローカルで実行した際に、ステートのバージョンが合わないという問題が発生する可能性を回避することができます。

「Shell」タブで `terraform version` を実行し、ワークスペースの **Settings >> General** 設定ページで **Terraform Version** を一致させるように設定します。

また、**Execution Mode** を **Local** に変更します。

ページ下部の **"Save settings" ボタンをクリックして、必ず設定を保存してください!** これで、ワークステーションからローカル変数を使って、Terraform コマンドを実行できるようになります、これは次のチャレンジで行います。