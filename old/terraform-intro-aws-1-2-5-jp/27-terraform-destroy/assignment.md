---
slug: terraform-destroy
id: ttfenchyif6u
type: challenge
title: "\U0001F525 Terraform Destroy"
teaser: |
  Terraform はインフラを構築するだけでなく、使い終わったら破棄することもできます。これにより、コストを抑制し、インフラの無秩序な拡散を抑えることができます。
notes:
- type: text
  contents: |-
    Terraform はインフラストラクチャを構築するのと同じくらい簡単に破壊することができます。

    `terraform destroy` は注意して利用する様にしてください。
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
Run the following command to destroy your infrastructure:

```
terraform destroy
```

You'll need to type "yes" when prompted to destroy your infrastructure. This is a safety feature to help prevent accidental deletion of important resources.

Wait until the destroy action has completely finished before clicking on the **Check** button.

Congratulations on completing the Intro to Terraform track!

以下のコマンドを実行して、インフラを破棄してください。

```
terraform destroy
```

インフラストラクチャを破棄するように促されたら、`yes` と入力する必要があります。これは重要なリソースが誤って削除されるのを防ぐための安全機能です。

`terraform destroy` が完全に終了するまで待ってから、**Check** ボタンをクリックしてください。

おめでとうございます！Intro to Terraform on AWS トラックは完了です！長時間お疲れ様でした。