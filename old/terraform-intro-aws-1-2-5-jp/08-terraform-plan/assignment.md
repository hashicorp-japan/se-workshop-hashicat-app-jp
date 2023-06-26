---
slug: terraform-plan
id: uwbdpnwbn3d4
type: challenge
title: "\U0001F914 Terraform Plan - Dry Run Mode"
teaser: |
  Terraform には Dry-Run モードがあり、実際にリソースを作成することなく、構築されるものをプレビューすることができます。このチャレンジでは、`terraform plan` を実行して出力を見てみます。
notes:
- type: text
  contents: |-
    コマンド `terraform plan` を使うと、環境に対するあらゆる変更を安全な方法でプレビューすることができます。

    これは、すでにビルドされた後ではなく、デプロイする前に予期せぬ変更を特定するのに役立ちます。
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
`terraform plan` コマンドを実行します。

```
terraform plan
```

このコマンドを実行すると、Terraform は `prefix` 変数を入力するよう促します。

小文字のアルファベットか数字で短い文字列を入力してください。姓(ex. yamada)と名(ex. taro)を使うことをお勧めします。

この `prefix` は、VPC、サブネット、EC2 インスタンス、その他のリソースの名前の一部となります。