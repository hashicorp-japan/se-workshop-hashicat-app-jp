---
slug: change-prefix
id: ldjmfnbz6mcb
type: challenge
title: "\U0001F6EB Change Your Prefix"
teaser: |
  Terraform のコードが変更されると、インフラも更新されたコードに合わせて変更されます。Terraform は宣言型言語です。
notes:
- type: text
  contents: |-
    Terraform は、インフラの作成、破壊、更新、または破壊して再作成することができます。リソースの種類によっては、削除せずに更新できるものもあります。大きな変更には通常、破棄と再構築が必要になります。

    Terraform は常に、現在のインフラを記述されたコードで定義されたものと一致させようとします。
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
`terraform.tfvars` ファイルを編集して、`prefix` を変更します。お望みなら、単に末尾に数字を追加することもできます。あるいは、まったく新しいものに変えて頂いても大丈夫です。

`terraform.tfvars` ファイルを保存して、もう一度 `apply` コマンドを実行してください。

```
terraform apply
```

プロンプトが表示されたら、`yes` と入力してください。

出力を見てください。何が起こったでしょうか？