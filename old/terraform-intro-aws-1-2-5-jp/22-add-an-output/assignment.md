---
slug: add-an-output
id: ypah9zcj76wb
type: challenge
title: "\U0001F5A8️ Add an Output"
teaser: |
  Terraform outputs は、IP アドレスやアプリケーションの URL など、有用な情報を伝えるために使用されます。
notes:
- type: text
  contents: Terraform のデータに加え、プレーンテキストを outputs に混ぜることができます。Outputs は、実行の最後にユーザーに有用な情報を伝えるために使用することができます。
- type: text
  contents: コマンド `terraform refresh` は、インフラストラクチャに存在するものとステートファイルを同期させます。`refresh`
    コマンドはインフラストラクチャそのものは変更しません。
- type: text
  contents: コマンド `terraform output` Terraform の outputs をもう一度見たい時にいつでも実行できます。一つの output
    を見るには、`terraform output <output_name>` を実行します。
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
「Code Editor」タブで `outputs.tf` ファイルを開いてください。ファイル内の `public_dns` の出力に注目してください。

Web サーバーの `public_ip` のために2番目の出力を追加します。これは、最初の出力とほとんど同じように見えますが、DNS 名の代わりに IP アドレスを出力します。

出力の名前は `catapp_ip` とします。

どのような出力が有効かは、docsページを参照してください。

[Terraform AWS Docs - Click Here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance#attributes-reference)
[Terraform Outputs Docs - Click Here](https://www.terraform.io/docs/configuration/outputs.html)

**必ず `outputs.tf` ファイルの変更を保存してください。**

`terraform refresh` コマンドを実行して、新しい出力を表示します。

```
terraform refresh
```

`terraform output` コマンドを実行すると、全ての出力を見ることができます。

```
terraform output
```

どちらかの URL をクリックすると、Web アプリを使用することができます。