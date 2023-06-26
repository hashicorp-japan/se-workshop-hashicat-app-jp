---
slug: terraform-init-provider
id: xudod4eusqkp
type: challenge
title: "\U0001F3E1 Terraform Init - Install the Providers"
teaser: |
  Terraform は、クラウド API と対話するためにプロバイダを必要とします。プロバイダは Terraform のコアとインフラストラクチャのプロバイダをつなぐ橋渡し役です。
notes:
- type: text
  contents: |-
    Terraform のコアプログラムは、それだけではあまり役に立ちません。Terraform は、クラウド API と対話できるようにするために、**プロバイダ** の助けを必要とします。Terraform には数百種類のプロバイダがあります。プロバイダ一覧は以下のリンクから確認する事が出来ます。

    https://registry.terraform.io/browse/providers

    ここではいくつかのプロバイダを使いますが、メインとなるのは *aws* プロバイダです。
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
HashiCat アプリケーションの Terraform コードをいくつかダウンロードしました。残りのトラックはこのソースコードを使用します。

Terraform で何かをする前に、ワークスペースを初期化する必要があります。「Shell」タブで以下のコマンドを実行します。

```
terraform init
```

`terraform init` コマンドは Terraform のコードをスキャンして、必要なプロバイダを特定し、それらをダウンロードします。

以下のコマンドを実行して、`aws` プロバイダが `.terraform` ディレクトリにインストールされたことを確認します。

```
ls .terraform/providers/registry.terraform.io/hashicorp
```

この隠しディレクトリには、すべてのモジュールとプラグインが格納されています。