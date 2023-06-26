---
slug: setup-our-environment
id: p8j7xafoshat
type: challenge
title: "\U0001F3E1 Moving in - Explore Your Workspace"
teaser: |
  hashicat アプリケーションの Terraform のコードを確認します。
notes:
- type: text
  contents: |
    環境をセットアップ中です。
    いつから始められるかは、右下に表示されるお知らせをご覧ください。
- type: text
  contents: Terraform コマンドラインツールは、MacOS、FreeBSD、OpenBSD、Windows、Solaris、Linux で利用可能です。
- type: text
  contents: Terraform の言語は、ヒトにもマシンにも読みやすいように設計されています。
- type: text
  contents: 最近のほとんどのコードエディタは Terraform のシンタックスハイライトに対応しています。
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
左側の「コードエディタ」タブを開きます。すると、hashhicat アプリケーションのための Terraform 設定ファイルがいくつか表示されます。`main.tf` というファイルを開いてください。なお、画面下のファイルタイプは、シンタックスハイライトと色を最適化するために、自動的に `hcl` に設定されています。

これらのファイルのいずれかを編集すると、その上のタブに青い点とディスクのアイコンが表示されます。**必ずディスクアイコンをクリックして変更を保存してください！** Instruqt エディタには「自動保存」はありません。

このトラックでは、「Shell」タブですべてのコマンドを実行してください。

おめでとうございます！AWS 上で Terraform を使い始める準備が整いました。残りのチャレンジでは、新しい Terraform のスキルを学びながら、`hashicat-aws` のサンプルアプリを使用します。

続行するには **Check** ボタンをクリックします。