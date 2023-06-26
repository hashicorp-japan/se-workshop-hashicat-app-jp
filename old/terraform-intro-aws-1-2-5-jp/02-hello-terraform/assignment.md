---
slug: hello-terraform
id: 5rra54rnvz7m
type: challenge
title: "\U0001F44B Getting to Know Terraform"
teaser: |
  Terraform の基礎とコマンドラインの構文を学びます。
notes:
- type: text
  contents: |-
    OSS Terraform は、ダウンロードしてラップトップや仮想ワークステーションから実行することができるコマンドラインアプリケーションです。

    Go 言語で書かれており、macOS、Linux、Windows で動作します。Terraform の最新版は https://www.terraform.io/downloads.html からいつでもダウンロードできます。
- type: text
  contents: |-
    Terraform をラップトップやワークステーションにインストールするのは簡単です。zip ファイルをダウンロードして解凍し、PATH のどこかに配置するだけです。

    ステップバイステップの説明は下記チュートリアルを見てください。

    https://learn.hashicorp.com/terraform/getting-started/install.html

    Terraform は、Instruqt のラボ環境には既にインストールされています。
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
まずは、Terraform の基本的なコマンドを紹介します。
「Shell」タブで以下のコマンドを実行します。

この環境で動作している Terraform のバージョンを確認します。

```
terraform version
```

コマンドの構文について気になることがあれば、いつでもヘルプを得ることができます。

```
terraform --help
```

Terraform は Windows, OSX, Linux 上で動作します。ラップトップやクラウドベースのワークステーションにインストールすることができます。

ここでは、左側の「Code Editor」と「Shell」タブであらかじめ設定された Terraform の環境を使用して、すべてのラボを行います。