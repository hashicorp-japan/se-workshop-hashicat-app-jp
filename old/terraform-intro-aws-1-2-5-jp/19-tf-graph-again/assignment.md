---
slug: tf-graph-again
id: atrdx4gdxquh
type: challenge
title: "\U0001F4C8 Terraform Graph"
teaser: |
  グラフを再確認し、何が変化したかを確認します。
notes:
- type: text
  contents: では、何が変わったのか、グラフを確認して見てみましょう。
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
以下のコマンドで Blast Radius サーバーを起動します。

```
blast-radius --serve .
```

次に、「Terraform Graph」タブに切り替えて、インフラストラクチャグラフを表示します。Web ページが空白の場合、更新アイコン (丸い矢印のようなもの) をクリックする必要があるかもしれません。

あなたのインフラストラクチャの Terraform グラフを確認してみましょう。依存関係は自動的にマップ化されます。このグラフは無料の Blast Radius ツールを使って作成されました。

**注意:** 既知のバグのため、グラフをドラッグしたりズームしたりすることができないかもしれません。この演習の主な目的は、Terraform が複雑なインフラストラクチャをどのようにマッピングするかを見ることです。ですから、グラフに色が表示されなくても気にしないでください。

Terraform はこのグラフを使って、どのリソースを並行して構築すれば最大の効率を得られるかを判断します。