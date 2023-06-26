---
slug: setup-our-environment
id: qqqkmgbc24v4
type: challenge
title: "\U0001F3E1 ワークスペースの設定"
teaser: コードエディターにHCL拡張機能を設定しワークスペースを開きます。
notes:
- type: text
  contents: |-
    環境を構築しています...<br>
    右下に状態が表示されます。
- type: text
  contents: TerraformはMacOS, FreeBSD, OpenBSD, Windows, Solaris, Linuxで利用できます。
- type: text
  contents: Terraformのコードは人間にもマシンにも優しい記述方式です。
- type: text
  contents: 多くのEditorでTerraformに特化したSyntax highlightをサポートしています。
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
このワークショップではVS CodeをEditorとして利用できます。
VS codeは将来使えなくなります。

左側のメニューのエクスプローラーバーにいくつかのファイルが表示されているはずです。これらはhashicatアプリケーション用のTerraformの設定ファイルです。

まず、EditorでTerraformのコードのシンタックスサポートを追加してみます。
そのために、Terraform extensionをインストールして、シンタックスハイライトを有効にします。拡張機能のアイコンをクリックしてください。

**hashicorp**を検索し、紫色で表示される "HashiCorp Terraform 2.x.y "を選択してください。
**Install in Remote**ボタンをクリックして、拡張機能をインストールします。
右上にある**Reload**ボタンでページをリロードすると拡張機能が有効化されます。

コードエディタで自動保存を有効にしているので、変更した内容は入力時に保存されます。手動でファイルを保存する心配はありません。

これでAzure上でTerraformを使う準備が整いました。残りの課題ではhashicat-azureのサンプルアプリを使用してTerraformのスキルを習得していきます。

**Check**ボタンをクリックして続行します。