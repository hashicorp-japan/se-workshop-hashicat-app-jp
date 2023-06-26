---
slug: tf-graph
id: bd5md0vmb0no
type: challenge
title: "\U0001F4C8 Terraform Graph"
teaser: Terraformは、コードに定義されているすべてのインフラストラクチャのグラフを作成できます。
notes:
- type: text
  contents: Terraform Graphは、すべてのインフラストラクチャを視覚的に表現することができます。これは、依存関係の問題や変更の影響を受けるリソースを見つけるのに便利です。
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
`terraform graph` コマンドを実行してみてください。

```
terraform graph
```

これは、インフラストラクチャのビジュアルマップを作成するために使用できるコードを生成します。グラフデータは、[DOTグラフ記述言語形式](https://en.wikipedia.org/wiki/DOT_(graph_description_language))です。このデータを可視化するために使用できるグラフ作成ツールは、無料のBlast Radiusツールなどいくつかあります。Blast Radiusの詳細については、こちらを参照してください。

https://28mm.github.io/blast-radius-docs/

次のコマンドでBlast Radiusサーバーを起動します。

```
blast-radius --serve .
```

ここで、**Terraform Graph**タブに切り替えて、インフラストラクチャグラフを表示します。ウェブページが空白の場合は、リロードアイコンしてみてください。。

インフラストラクチャのTerraformグラフを見てみましょう。依存関係は自動的にマップされます。このグラフは、無料のBlast Radiusツールを使用して作成しました。

Terraformはこのグラフを使って、どのリソースを並列に構築して効率を最大化するかを判断しています。