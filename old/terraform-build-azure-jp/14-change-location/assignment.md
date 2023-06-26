---
slug: change-location
id: cpdqkjybiqxh
type: challenge
title: "\U0001F6EB Locationを実際に変更してみる"
teaser: Terraformのコードが変更されると、インフラは更新されたコードにマッチするに変更されます。 Terraformはインフラの望むべき姿を記述する宣言型言語です。
notes:
- type: text
  contents: |-
    Terraformは、インフラの作成、破壊、更新、再作成することができます。リソースの種類によっては、削除せずに更新できるものもあります。大規模な変更の場合は、通常、再構築が必要になります。

    Terraformは、常に現在のインフラストラクチャをコードで定義されたものと一致させようとします。
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
**terraform.tfvars**ファイルを編集して、Azure resource groupのLocationを変更してみてください。

例:<br>

Japan East - 埼玉 <br>
Japan West - 大阪 <br>


terraform.tfvars**ファイルを保存してから、planコマンドを実行してください。

```
terraform plan
```

出力をみてください。何か変化があることに気づきましたか？？

それではアプライしてみましょう。自動承認フラグ `-auto-approve` を使うことで、毎回 "yes "と入力しなくても済むようになります。

```
terraform apply -auto-approve
```