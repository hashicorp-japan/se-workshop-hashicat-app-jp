---
slug: aws-credentials
id: eoyb8mm7mr6z
type: challenge
title: "\U0001F510 Connecting Terraform to AWS"
teaser: |
  アクセスキーとシークレットキーを使って AWS 環境に接続します。
notes:
- type: text
  contents: HCL とは、「HashiCorp Configuration Language」の略であることをご存知ですか？
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
AWS やビルドリソースを認証するために、Terraform では適切な IAM ポリシーに裏付けられた一連の認証情報を提供する必要があります。

今回の環境では、一時的な AWS 認証情報を用意し、環境変数として保存しています。Terraform はシェル環境に設定された環境変数を自動的に読み込んで使用します。

「Shell」タブで以下のコマンドを実行します。

```
echo $AWS_ACCESS_KEY_ID
echo $AWS_SECRET_ACCESS_KEY
```

有効な AWS キーが表示されるはずです。そうでない場合は、**Close** ボタンでトラックのホームページに戻り、トラックを停止して、再起動します。

**クラウドの認証情報は、誤って公開されたり、公開リポジトリにコピーされたりする可能性があるため、ソースコードには絶対に記述しないでください。**