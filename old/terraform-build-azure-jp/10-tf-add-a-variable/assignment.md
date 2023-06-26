---
slug: tf-add-a-variable
id: yehyged79hl0
type: challenge
title: "\U0001F5FC Locationを変更する"
teaser: Terraformは、世界中のどこにでもインフラを展開できる柔軟性を備えています。 以下のように、さまざまな地域でアプリケーションを簡単にプロビジョニングすることができます。
  は、単に単一の変数を変更するだけです。
notes:
- type: text
  contents: ファイルで定義されている変数の上書きは各自の **terraform.tfvars** ファイルで行います。
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
一つ前の課題では、*prefix*変数を設定しました。<br><br>
次に`location`変数を設定してみましょう。
最寄りのAzureロケーションを選択し、**terraform.tfvars**ファイルに`location`変数を記述してください。<br>

```
location = "Japan East"
```
有効なAzureの場所のリストは、[こちら](https://azure.microsoft.com/en-us/global-infrastructure/data-residency/)になります。 <br><br>
例：<br>
Japan East - 埼玉 <br>
Japan West - 大阪 <br>

`location`変数を設定したら、もう一度 `terraform plan` を実行してみてください。

`location`が設定した値になっていることを確認してください。<br>
```
+ location = "japaneast"
```