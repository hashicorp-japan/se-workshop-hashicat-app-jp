---
slug: terraform-destroy
id: dj65fnh0szry
type: challenge
title: "\U0001F525 Terraform Destroy"
teaser: Terraformは、インフラストラクチャを構築するだけでなく、使い終わった後にそれを破棄することもできます。これにより、インフラの無駄な利用を減らしコストをコントロールできます。
notes:
- type: text
  contents: Terraformはインフラを構築するのと同じくらい簡単に破壊することができます。Terraformの使用には注意が必要です。
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
以下のコマンドを実行してインフラを破壊してください。

```
terraform destroy
```

インフラストラクチャをDestroyするように促されたら、「yes」と入力する必要があります。これは、重要なリソースが誤って削除されるのを防ぐための安全機能です。

*Check*ボタンをクリックする前に、Destroyが完全に終了するまで待ってください。