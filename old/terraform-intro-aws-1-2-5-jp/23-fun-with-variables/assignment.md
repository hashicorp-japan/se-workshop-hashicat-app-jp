---
slug: fun-with-variables
id: wrcc2puftzzs
type: challenge
title: "\U0001F436 Fun With Variables"
teaser: |
  変数は、Terraform コードの消費者に、インフラをカスタマイズする簡単な方法を提供します。
notes:
- type: text
  contents: |-
    Terraform の変数には5段階の優先順位があります。1=最高 5=最低。

    1. CLI フラグ - CLI で指定して実行
    2. 設定ファイル - `terraform.tfvars` ファイルで設定
    3. 環境変数 - シェルの環境変数の一部で設定
    4. デフォルト設定 - `variables.tf` ファイル内のデフォルト値
    5. マニュアル指定 - 設定していない場合、プロンプトにて入力
- type: text
  contents: |-
    変数 `placeholder` を使って試せる、他の楽しいプレースホルダー・サイトを以下に紹介します。

    placedog.net<br>
    placebear.com<br>
    www.fillmurray.com<br>
    www.placecage.com<br>
    placebeard.it<br>
    loremflickr.com<br>
    baconmockup.com<br>
    placeimg.com<br>
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
Terraform の変数を設定する方法はいくつかあります。今までは `terraform.tfvars` ファイルを使って変数を設定してきました。コマンドラインで異なる `height` と `width` 変数を指定して、アプリケーションを再デプロイしてみてください。変更を確認するために、それぞれの適用後に Web アプリをリロードしてください。

```
terraform apply -auto-approve -var height=600 -var width=800
```

次に、Terraform が読み取れる環境変数を設定してみます。以下のコマンドを実行して、`placeholder` 変数を設定します。

```
export TF_VAR_placeholder=placedog.net
```

`terraform apply -auto-approve` コマンドを実行します。

```
terraform apply -auto-approve
```

今度は、コマンドラインで同じ変数の設定を変えて、もう一度試してみてください。

```
terraform apply -auto-approve -var placeholder=placebear.com
```

どちらの変数が優先されましたか?

変数の優先順位については、こちらの [doc](https://www.terraform.io/docs/configuration/variables.html#variable-definition-precedence) を参照してください。