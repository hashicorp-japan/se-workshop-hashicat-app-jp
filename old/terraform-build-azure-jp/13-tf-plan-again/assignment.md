---
slug: tf-plan-again
id: sk8t3vdoxzls
type: challenge
title: "\U0001F469‍\U0001F4BB テストと修正"
teaser: Terraformは冪等（べきとう）です。つまり、同じ操作を何回行っても同じ結果になります。 よって、変更のないリソースに対しては何もおこないません。
notes:
- type: text
  contents: |-
    Terraformは冪等（べきとう）です。つまり、同じ操作を何回行っても同じ結果になります。よって、変更のないリソースに対しては何もおこないません。

    冪等性（Idempotence）とは、数学や計算機科学における特定の演算の特性のことで、最初に適用された結果を変更することなく、複数回適用することができるというものです。

    https://en.wikipedia.org/wiki/Idempotence
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
もう一度 `terraform plan` を実行してみてください。

```
terraform plan
```

Azureリソースグループはすでに構築されており、コードで記述された「望むべき姿」になっているので、Terraformは変更の必要がないと判断します。

```shell
No changes. Infrastructure is up-to-date.
```

これは正常であり、想定通りです。

では、applyを実行してみてください。

```
terraform apply
```

Terraformは、各リソースが適切な状態にあるかどうかをチェックします。すでに正しくプロビジョニングされている場合は、リソースグループを再作成することはありません。
つまり、Terraformはコードやインフラに変更がない限り、いつ何度実行しても安全です。

```console
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```