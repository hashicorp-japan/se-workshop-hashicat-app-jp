---
slug: terraform-code
id: 7rgxt7bgyez3
type: challenge
title: "\U0001F468‍\U0001F4BB What does Terraform code look like?"
teaser: |
  Terraform DSL (Domain Specific Language) は、ほとんどすべてのタイプのインフラを構築することができる宣言型言語です。
notes:
- type: text
  contents: |-
    Terraform はカレントディレクトリにある `*.tf` または `*.tfvars` で終わるファイルをすべて読み込むことができます。

    慣習的に、ほとんどの Terraform ワークスペースには `main.tf`, `variables.tf`, `outputs.tf` ファイルが含まれることになります。

    また、Terraform のコードを目的別にファイルにまとめることもできます。例えば、ロードバランサーの設定コードをすべて `load_balancer.tf` というファイルに格納することができます。
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
Terraform のコードをあなたのワークステーションにダウンロードしました。以下のコマンドを実行すると、Terraform のコードファイルが表示されます。

```
ls *.tf
```

同じファイルが左側のファイルエクスプローラーペインに表示されます。Terraform のファイルには紫色のTのアイコンが表示されます。

Terraform のコードは常に `.tf` という拡張子で終わります。Terraform のファイルはいくつでも作成できますが、一般的には以下の 3つが最初に作成されます。

  `main.tf` - Terraform のコードのほとんどが格納されています。リソースのビルドを行う部分です。
  `variables.tf` - ユーザーが利用できる変数を定義するためにこのファイルを使用します。
  `outputs.tf` - このファイルには、Terraform の実行が成功したときに表示される出力が含まれています。

末尾が `*.tf` または `*.tfvars` 以外のファイルは、Terraform によって無視されます。