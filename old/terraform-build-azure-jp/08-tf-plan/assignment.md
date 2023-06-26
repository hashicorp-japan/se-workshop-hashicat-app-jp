---
slug: tf-plan
id: 9cgezhdqv615
type: challenge
title: "\U0001F914 Terraform Plan - ドライラン"
teaser: Terraformにはドライランモードがあります。構築しようしとしているリソースを事前に確認できます。ここでは、Terraform planを実行して出力を表示します。
notes:
- type: text
  contents: |-
    `terraform plan` は、インフラへの変更を安全な方法でプレビューすることができます。

    これは、デプロイする前に予期せぬ変更を発見するのに役立ちます。
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
**terraform plan**コマンドを実行してください。
```
terraform plan
```
このコマンドを実行すると、Terraform は `prefix` 変数の入力を求めてきます。

小文字または数字の短い文字列を入力します。必要に応じて、自分の名前を入力しても構いません。

**プレフィックス文字列はすべて小文字で、長さは5～12文字以内にしてください。プレフィックスにはアンダースコアは使用しないでください。

プレフィックスはアプリケーションのホスト名の一部となるため、DNSに準拠している必要があります。ホスト名で有効な文字は、aからzまでのASCII(7)文字、0から9までの数字、ハイフン(-)です。 ホスト名はハイフンで始まることはできません。