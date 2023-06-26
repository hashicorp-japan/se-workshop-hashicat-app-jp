---
slug: tf-plan-again
id: 6x9caomdffv3
type: challenge
title: "\U0001F469‍\U0001F4BB Test and Repair"
teaser: |
  Terraform は冪等性を持っています。コード内の各リソースは調査され、もし既に存在していれば Terraform はそれをそのままにします。
notes:
- type: text
  contents: |-
    Terraform は 冪等性を持ったアプリケーションです。

    冪等とは、数学やコンピュータサイエンスにおけるある種の操作の特性で、最初に適用した以上の結果を変えずに何度でも適用できることを意味します。

    https://en.wikipedia.org/wiki/Idempotence
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
もう一度 `terraform plan` を実行して、何が起こるか見てみましょう。

```
terraform plan
```

VPC は既に構築されているので、Terraform は変更の必要がないことを報告します。

これは正常で期待通りの結果です。

では、別の適用を実行してみましょう。

```
terraform apply
```

Terraform は各リソースをチェックして、適切な状態であることを確認します。VPC が既に正しくプロビジョニングされている場合は再作成されません。