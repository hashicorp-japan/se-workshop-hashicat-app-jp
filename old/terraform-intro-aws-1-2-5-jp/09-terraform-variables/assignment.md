---
slug: terraform-variables
id: eyuqauz2v3zd
type: challenge
title: "\U0001F39B️ Working with Terraform Variables"
teaser: |
  Terraform の変数を使えば、コードを編集することなくインフラをカスタマイズすることができます。同じ Terraform のコードを使って、開発環境、ステージング環境、本番環境をデプロイすることができますが、異なる変数を使用することができます。
notes:
- type: text
  contents: ファイル `terraform.tfvars` は、ユーザーが変数を設定するのに便利な場所です。
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
Terraform では、すべての変数を使用する前に（オプションのデフォルト値の有無にかかわらず）宣言する必要があります。変数は通常 `variables.tf` ファイルで宣言されますが、他の `*.tf` ファイルで宣言することもできます。変数の値は `terraform.tfvars` ファイルや他の方法で設定することができますが、後ほど説明します。

`terraform.tfvars` ファイルを開き、変数 `prefix` の行頭の `#` を削除し、`yourname` を自分の名前（姓と名の間にハイフンがあってもなくてもよく、すべて小文字）に置き換えて設定します。

**必ずファイルの上にあるディスクアイコンをクリックして変更を保存してください！**

さて、もう一度 `terraform plan` を実行してください。今度は `prefix` を手動で入力する必要はありません。