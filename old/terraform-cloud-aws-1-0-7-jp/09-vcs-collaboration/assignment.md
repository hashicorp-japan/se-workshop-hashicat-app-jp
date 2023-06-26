---
slug: vcs-collaboration
id: gewzvxtzozrg
type: challenge
title: "\U0001F46C Collaborating with VCS"
teaser: |
  バージョン管理システムを Terraform Cloud で設定したことで、Terraform で構築したインフラの変更を共同で行うことができるようになります。
notes:
- type: text
  contents: "ACME のマーケティングチームが来週、特別なプロモーションを行うので、hashicat のウェブサイトに変更を加えて欲しいとのこと。インストラクター主導のクラスであれば、仲間とペアを組んでこのエクササイズを行うことができます。あるいは、一人でこのエクササイズを行うこともできます。\n\n>\U0001F468\U0001F3FB‍\U0001F9B2
    システム管理者の方、hashicat のウェブサイトに変更を加える必要があります。洒落たマーケティング・スローガンでプレースホルダー・テキストを更新してもらえませんか？"
- type: text
  contents: VCS と連携したワークスペースでは、コードレビューや自動テストなどの機能が利用でき、変更が本番で承認される前に Pass しなければなりません。
tabs:
- title: Shell
  type: terminal
  hostname: workstation
- title: Code Editor
  type: code
  hostname: workstation
  path: /root/hashicat-aws
difficulty: basic
timelimit: 1800
---
このチャレンジでは、hashicat-aws アプリケーションをデプロイするコードに小さな変更を加え、「プルリクエスト」を作成します。

プルリクエストとは、単に変更を提案し、オプションで他の人が変更をレビューできるようにする方法です。

パートナーを見つけるか、一人の場合はこの演習を一人で行うことができます。github のユーザー名を交換し、相手の hashicat-aws リポジトリのフォークを参照します。例えば、次のようになります。

https://github.com/YOURNAME/hashicat-aws

**hashicorp/hashicat-aws リポジトリに対してプルリクエストを発行しないでください!!**

Step 1: Modify file on GitHub
=============================

GitHub 上のレポジトリ `YOURNAME/hashicat-aws` で `files/deploy_app.sh` ファイルを参照して、テキストエリアの右上にある小さな鉛筆アイコンをクリックします。

これにより、ブラウザ上でファイルを編集することができます。

以下のテキストを、ACME のキャッチーなマーケティングスローガンに置き換えてください。

```text
Welcome to ${PREFIX}'s app. Replace this text with your own.
```

Step 2: Create pull request
=============================

画面の下部で、「Create a new branch for this commit and start a pull request」と書かれたオプションを選択します。

次に、「Propose changes」ボタンをクリックします。

最後に、「Create pull request」ボタンをクリックしてプルリクエストを送信します。

Step 3: Confirm speculative plan
=============================

Terraform Cloud のワークスペース `hashicat-aws` に対してチェックが実行されていることがわかります。

チェックの「Details」リンクを右クリックし、新しいタブでリンクを開くと、ワークスペースで実行された Speculative Plan が表示されます。

ただし、リンクを開く際には GitHub のページを更新しないとチェックに合格したことが確認できず、「Merge pull request」ボタンが有効になってしまうかもしれません。

パートナーがプルリクエストを確認して承認してくれるはずです。

あるいは、一人で作業している場合は自分のプルリクエストを確認して、「Merge pull request」 > 「Confirm merge」をクリックすることで変更をマージすることもできます。

変更内容を master ブランチにマージしたら、Terraform Cloud UI で開始される Terraform の実行を確認します。