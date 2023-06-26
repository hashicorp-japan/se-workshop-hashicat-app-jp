---
slug: tf-validate
id: mwy93hqxoomr
type: challenge
title: "\U0001F469‍⚖️ Terraform Validate - コードの検証"
teaser: Terraformには検証テスターが内蔵されています。Terraformコードがシンタクス的に正しいか解析してくれます。
notes:
- type: text
  contents: Terraformにはシンタクスチェッカーが組み込まれています。これは `terraform validate` コマンドで実行できます。
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
Terraform には **validate** というサブコマンドが組み込まれています。これは、コードが正しく解析されているかどうか、構文チェックをしたいときに便利です。

左側の File Explorer アイコンをクリックしてください。書類のようなアイコンです。

main.tfファイルを編集し、ファイルの12行目の `}` を削除してください。

コードを検証します。

```
terraform validate
```

コードのエラーが検知されます。

コードをもとに戻し、validateコマンドを再度実行し、コードに問題がないか検証してください。
```
Success! The configuration is valid.
```

**terraform validate** は、自動化された CI/CD テストパイプラインでよく使われます。これにより、他のステップが実行される前にコードのエラーを素早くキャッチすることができます。