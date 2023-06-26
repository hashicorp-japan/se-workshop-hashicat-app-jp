---
slug: private-module-registry
id: decbqorhivpy
type: challenge
title: "\U0001F4DA Private Module Registry"
teaser: |
  ユーザーの中には、S3 バケットをデプロイする簡単な方法を求めている人もいるでしょう。プライベートモジュールレジストリは、標準的で再利用可能な Terraform コードを保存し、他のユーザーが自分のワークスペースで使用できるようにします。
notes:
- type: text
  contents: "devops チームのほとんどが Terraform を使ってインフラを構築・設定しています。最近では、チーム外のユーザーから、自分のワークスペースの構築を手伝ってほしいという要望が寄せられています。データベース管理者の
    Gaurav は、昼食時にあなたを見かけて助けを求めてきました:\n>\U0001F473\U0001F3FE‍♂️ いくつかの S3 バケットを設定する必要がありますが、このための
    Terraform モジュールがあると聞きました。 hashicat-aws のワークスペースに新しい S3 バケットをセットアップするのを手伝ってもらえませんか？"
tabs:
- title: Code Editor
  type: service
  hostname: workstation
  port: 8443
- title: Text Editor
  type: code
  hostname: workstation
  path: /root/hashicat-aws
- title: Shell
  type: terminal
  hostname: workstation
difficulty: basic
timelimit: 1800
---
このチャレンジでは、Terraform コードの再利用可能なモジュールを保存してバージョン管理できる、プライベートモジュールレジストリの使い方を学びます。

このモジュールをゼロから書く代わりに、パブリック Terraform レジストリから既存の AWS s3-bucket モジュールをコピーすることができます。この[URL](https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws)にアクセスして、s3-bucket モジュールをご覧ください。

このモジュールの GitHub リポジトリを指す**Source Code**のリンクに注目してください。ソースURLをクリックします。前回のチャレンジで行ったように、「Fork」ボタンでこのリポジトリの独自のフォークを作成します。

Terraform Cloud UI に戻り、ページ上部の "Registry" タブをクリックします。"Publish Private Module +"ボタンをクリックします。"GitHub" ボタンをクリックし、先ほどフォークした terraform-aws-s3-bucket リポジトリを選択します。

"Publish module"ボタンをクリックします。

モジュールの公開が完了したら、画面左上の **Version** の下にある **Change** をクリックして、モジュールのバージョン`2.2.0`を選択してください。`2.2.0`が表示されていない場合は、バージョンの公開に時間がかかることがありますので、一度ページを更新してください。

hashicat-aws ディレクトリに `s3-bucket.tf` という新しい Terraform ファイルを作成し、このファイルのモジュールを使って Gaurav 用の新しい S3 バケットを作成します。モジュール作成コードは、Private Module Registry のモジュールのページの "Provision Instructions" セクションからコピーできます。

モジュールの "Inputs" タブをクリックします。これは、いくつかのモジュール変数（入力）を指定しなければならないことを示していますが、それらはすべてオプションとしてマークされています。モジュール変数（入力）の`bucket_prefix`には、`prefix`変数の値を設定することをお勧めします。これにより、AWSプロバイダは、あなたのプレフィックスで始まるバケット名を生成します。

`s3-bucket.tf` ファイルの保存が完了したら、最新の変更をリモートフォークに追加、コミット、プッシュすることができます。変更をプッシュする際には、github アカウントへのログインが求められます。

```
git add .
git commit -m "Added s3 bucket module"
git push origin master
```

すべてがうまくいくと、新しい S3 バケットが構築されているのがコンソール出力に表示されます。`terraform apply` コマンドが完了するまで待ってから、**Check**ボタンをクリックして動作を確認してください。