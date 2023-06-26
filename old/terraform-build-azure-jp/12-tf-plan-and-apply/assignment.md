---
slug: tf-plan-and-apply
id: qcxxabykzdiy
type: challenge
title: "\U0001F468‍\U0001F4BB Terraform PlanとTerraform Apply"
teaser: terraform plan コマンドはいつでも実行でき、変更のプレビューを得ることができます。 terraform apply を実行すると、これらのリソースの構築、更新、または破壊を行います。
notes:
- type: text
  contents: terraform applyは、terraform planの結果をもとにして実行されます。
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
必要な変数を設定したので、変更を適用することができます。

まず `terraform plan` コマンドを実行して何が起こるか見てみましょう。

```
terraform plan
```
適切なprefixとLocationがプラン出力に表示されていることを確認します。

そして *terraform apply* を実行して、あなたのリソースグループが構築されるのを見てください。

```
terraform apply
```

Terraformが "Do you want to perform these actions? "という質問をしてきたら、`yes` を入力する必要があります。

現在、このコードは単一のAzureリソースグループのみを定義しています。これからの課題では、このリソースグループへ様々なリソースを構築していきます。