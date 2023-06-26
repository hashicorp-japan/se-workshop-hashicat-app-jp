---
slug: vcs-collaboration
id: vboxnsngbbcn
type: challenge
title: "\U0001F46C VCSと連携する"
teaser: |
  バージョン管理システムを Terraform Cloud で設定したことで、Terraform で構築したインフラの変更を共同で行うことができるようになります。
notes:
- type: text
  contents: "ACME .Inc のマーケティングチームが来週、特別なプロモーションを行うので、hashicat のウェブサイトに変更を加えて欲しいとのことです。インストラクター主導のクラスであれば、仲間とペアを組んでこのエクササイズを行うことができます。あるいは、一人でこのエクササイズを行うこともできます。\n\n>\U0001F468\U0001F3FB‍\U0001F9B2
    hashicat のウェブサイトに変更を加える必要があります。洒落たマーケティングスローガンでプレースホルダーテキストを更新してくれませんか？"
- type: text
  contents: VCS と連携されたワークスペースでは、コードレビューや自動テストなどの機能が利用でき、変更が本番で承認される前に通過しなければなりません。
tabs:
- title: Text Editor
  type: code
  hostname: workstation
  path: /root/hashicat-azure
- title: VS Code Editor
  type: service
  hostname: workstation
  port: 8443
- title: Shell
  type: terminal
  hostname: workstation
- title: Terraform Cloud
  type: external
  url: https://app.terraform.io
difficulty: basic
timelimit: 1800
---
この課題では、hashicat-azure アプリケーションをデプロイするコードに小さな変更を加え、"プルリクエスト"を作成します。"プルリクエスト"とは、単に変更を提案し、オプションで他の人が変更をレビューできるようにする方法です。

パートナーを見つけるか、一人の場合はこの演習を一人で行うことができます。github のユーザー名を交換し、相手の hashicat-azure リポジトリのフォークを参照します。例えば、次のようになります。

https://github.com/YOURNAME/hashicat-azure

**フォーク元の hashicorp/hashicat-azure リポジトリに対してプルリクエストを発行しないでください!**

`files/deploy_app.sh` ファイルを参照して、テキストエリアの右上にある小さな鉛筆アイコンをクリックします。これにより、ブラウザ上でファイルを編集することができます。

以下のテキストを、ACME のキャッチーなマーケティングスローガンに置き換えてください。

```
Welcome to ${PREFIX}'s app. Replace this text with your own.
```

日本語を入力したい場合は、Htmlの<Head>部分に以下のように文字コードを指定してください。こちらはUTF-8を指定しています。

```
<meta charset="utf-8"/>
```

画面の下部で、"Create a new branch for this commit and start a pull request" というオプションを選択します。次に、"Propose changes "ボタンをクリックします。最後に、"Create pull request "ボタンをクリックしてプルリクエストを送信します。

Terraform Cloud のワークスペースに対してチェックが実行されていることがわかります。チェックの「Details」リンクを右クリックし、新しいタブでリンクを開くと、ワークスペースで実行された plan が表示されます。

ただし、リンクを開く際には GitHub のページを更新しないとチェックに合格したことが確認できず、"Merge pull request" ボタンが有効になってしまうかもしれません。

パートナーがプルリクエストを確認して承認してくれるはずです。あるいは、一人で作業している場合は自分のプルリクエストを確認して変更をマージすることもできます。

変更内容を master ブランチにマージしたら、Terraform Cloud UI で開始される Terraform の実行を確認します。