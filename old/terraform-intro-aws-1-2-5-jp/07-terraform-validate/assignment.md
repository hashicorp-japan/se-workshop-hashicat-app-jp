---
slug: terraform-validate
id: qyzvii5c0iby
type: challenge
title: "\U0001F469‍⚖️ Terraform Validate - Test Your Code"
teaser: |
  Terraform には Validation Tester が内蔵されています。これはあなたの Terraform コードが有効かどうか、正しくパースされているかどうかを確認するのに便利です。
notes:
- type: text
  contents: Terraform には組み込みのシンタックスチェッカーがあります。これを実行するには、`terraform validate` コマンドで実行できます。
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
Terraform には、`validate` という組み込みのサブコマンドがあります。これは、コードが正しくパースされているか、簡単な構文チェックを行いたいときに便利です。

`main.tf` ファイルを編集し、14行目の `aws_vpc` と `hashicat` の間のダブルクオートを削除し、間にあったスペースはそのままにします。ファイルを保存してください。

以下のコマンドでコードを検証します。

```
terraform validate
```

今度は14行目にダブルクオートを戻し、ファイルを保存して、もう一度 `validate` コマンドを実行してください。今度はバリデーションテストに合格しているはずです。

`terraform validate` は CI/CD パイプラインで最もよく使用されます。他のステップが実行される前に、コードのエラーを素早くキャッチすることができます。