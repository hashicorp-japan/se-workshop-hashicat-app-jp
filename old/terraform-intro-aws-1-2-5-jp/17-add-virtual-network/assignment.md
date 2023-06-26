---
slug: add-virtual-network
id: nand1ychj0nh
type: challenge
title: "\U0001F5A7 Add a Virtual Network"
teaser: |
  Terraform リソースは積み木のようなものです。あなたのインフラが望ましい状態になるまで、ブロックを追加し続けることができます。
notes:
- type: text
  contents: Terraform のコードは、一度に1つまたは2つのリソースをインクリメンタルに構築することができます。
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
再び `main.tf` ファイルを開き、ファイル内の次のリソースブロックのコメントを解除します。リソースの種類は `aws_subnet` で、名前は `hashicat` です。

各行の先頭の `#` 文字を削除して、コードをアンコメントします。**必ずファイルを保存してください。**

さて、もう一度 `terraform apply` を実行してください。結果を観察してください。

`aws_subnet` リソース内の `vpc_id` パラメータを見ます。ファイル内の最初のリソースを指しているのがわかりますか？サブネットリソースは VPC から設定を継承しています。

Terraform は、何百もの相互接続されたリソース間の複雑な依存関係の網をマッピングすることができます。