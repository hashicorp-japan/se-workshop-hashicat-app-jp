---
slug: tf-plan-and-apply
id: pyjurzctc3eu
type: challenge
title: "\U0001F468‍\U0001F4BB Terraform Plan and Terraform Apply"
teaser: |
  `terraform plan` コマンドはいつでも実行でき、Terraform が行うかもしれない変更のプレビューを得ることができます。`terraform apply` を実行すると、これらの変更が実行され、Terraform はリソースをビルド、アップデート、または破棄します。
notes:
- type: text
  contents: |-
    デフォルトでは、`terraform apply` コマンドは Terraform plan を実行し、どのような変更を加えたいかを表示します。

    Terraform は apply する前に、必要なすべての変更をマップします。
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
必要な変数の設定ができたので、変更を適用してみましょう。

まずは `terraform plan` コマンドを実行して、何が起こるか見てみましょう。

```
terraform plan
```

適切なプレフィックスとロケーションがプランの出力に表示されることを確認します。

次に `terraform apply` を実行して、リソースが構築されるのを確認します。

```
terraform apply
```

Terraform が `Do you want to perform these actions?` という質問をしてきたら、`yes` と入力する必要があります。

今のコードでは VPC を定義するだけです。次のチャレンジでは、他のリソースもプロビジョニングしていきます。