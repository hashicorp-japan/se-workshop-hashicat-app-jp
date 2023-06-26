---
slug: tf-graph
id: qpmf9n1gim0r
type: challenge
title: "\U0001F4C8 Terraform Graph"
teaser: |
  Terraform は、あなたのコードで定義されたすべてのインフラのグラフを作成します。
notes:
- type: text
  contents: Terraform Graph は、あなたのすべてのインフラを視覚的に表現することができます。 これは、依存関係の問題や、変更によって影響を受けるリソースを見つけるのに便利です。
tabs:
- title: Shell
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

このコマンドは、あなたのインフラのビジュアルマップを作成するために使用できるコードを生成します。グラフデータは [DOT graph description language format](https://en.wikipedia.org/wiki/DOT_(graph_description_language)) になっています。このデータを視覚化するために使用できるグラフツールがいくつかあり、無料のBlast Radius ツールもその一つです。Blast Radius については、こちらで詳しく説明しています。

https://28mm.github.io/blast-radius-docs/

以下のコマンドで Blast Radius サーバーを起動します。

```
blast-radius --serve .
```

次に、「Terraform Graph」タブに切り替えて、インフラストラクチャグラフを表示します。Web ページが空白の場合、更新アイコン (丸い矢印のようなもの) をクリックする必要があるかもしれません。

あなたのインフラストラクチャの Terraform Graph を調べてみましょう。依存関係は自動的にマップ化されます。このグラフは無料の Blast Radius ツールを使って作成されています。

**注意:** 既知のバグのため、グラフをドラッグしたり、ズームしたりすることが出来ないかもしれません。この演習の主な目的は、Terraform が複雑なインフラストラクチャをどのようにマッピングするかを見ることです。ですから、グラフに色が表示されなくても気にしないでください。

Terraform はこのグラフを使って、どのリソースを並行して構築すれば最大の効率を得られるかを判断します。