---
slug: add-a-tag
id: hsxqcgvk9lb6
type: challenge
title: "\U0001F3F7️ Add a Tag to Your VPC"
teaser: |
  Terraform は一部のリソースを削除せずに変更することができます。タグの追加は非破壊的な行為です。
notes:
- type: text
  contents: タグの追加、変更、削除は非破壊的な操作です。Terraform は、リソースを再作成することなくタグ付けすることができます。
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
いくつかのリソースタイプは AWS のタグをサポートしています。引数 `tags` とそのフォーマットについては、`aws_vpc` リソースの Terraform ドキュメントをお読みください。

[Terraform Docs: the aws_vpc resource - Click Here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)

`main.tf` ファイル内の VPC リソースにタグを追加します。タグの名前は `environment` で、値は `Production` にします。(タグは大文字と小文字を区別します。必ず大文字の `P` を使用してください。)

**Hints:** 例をよく読んでください。今まで見てきた他のリソース引数とは異なり、`tags` 引数の値は **map** (`{key = "value"}` データ構造) である必要があります。さらに、`tags` の後と `environment` の後には `=` を使用しなければなりません。Terraform のデータ型については、[Terraform language documentation](https://www.terraform.io/docs/configuration/expressions.html#types-and-values) を参照してください。

`terraform apply` を再実行します。

どうなりますか？