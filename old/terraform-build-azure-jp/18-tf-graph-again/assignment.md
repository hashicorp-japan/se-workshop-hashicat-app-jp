---
slug: tf-graph-again
id: ypdusd4lkqpr
type: challenge
title: "\U0001F4C8 Terraform Graph"
teaser: Graphを再度表示して何が変更されたら確認してみましょう。
notes:
- type: text
  contents: Graphを再度表示して何が変更されたか確認してみましょう。
tabs:
- title: Command Line
  type: terminal
  hostname: workstation
- title: Terraform Graph
  type: service
  hostname: workstation
  port: 5000
difficulty: basic
timelimit: 1000
---
次のコマンドでBlast Radiusサーバーを起動します。

```
blast-radius --serve .
```

ここで、**Terraform Graph**タブに切り替えて、インフラストラクチャグラフを表示します。ウェブページが空白の場合は、リロードアイコン（丸い矢印のようなもの）をクリックする必要があります。

インフラストラクチャのTerraformグラフを見てみましょう。依存関係は自動的にマップされます。このグラフは、無料のBlast Radiusツールを使用して作成しました。

**注:** 既知のバグにより、グラフのドラッグやズームができない場合があります。この演習の主なポイントは、Terraform が複雑なインフラストラクチャをどのようにマッピングするかを見ることです。グラフに色がついていなくても気にしないでください。

Terraformはこのグラフを使って、どのリソースを並列に構築して効率を最大化するかを判断しています。