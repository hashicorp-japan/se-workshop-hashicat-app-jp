---
slug: fun-with-variables
id: fvxo3ckjabfg
type: challenge
title: "\U0001F436 変数で遊んでみる"
teaser: Terraformコードの変数でインフラを簡単にカスタマイズできます。
notes:
- type: text
  contents: |-
    Terraformの変数は5段階の優先順位を持っています。1=最高 5=最低

    1. Command line flag - コマンドラインの引数で設定される値
    1. Configuration file - terraform.tfvarsで設定される値
    1. Environment variable - 環境変数で設定される値
    1. Default Config - variables.tfで設定されるデフォルトの値
    1. User manual entry - TerraformのRunの際に求められるプロンプトで設定される値
- type: text
  contents: |-
    変数 **placeholder** で試すことができる他の楽しいプレースホルダサイトをいくつか紹介します。

    placedog.net<br>
    placebear.com<br>
    www.fillmurray.com<br>
    www.placecage.com<br>
    placebeard.it<br>
    loremflickr.com<br>
    baconmockup.com<br>
    placeimg.com<br>
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
Terraformの変数を設定する方法はいくつかあります。これまでは **terraform.tfvars** ファイルを使って変数を設定してきました。コマンドラインで **height** と **width** の変数を変えてアプリケーションを再デプロイしてみてください。Applyが適用された後、変更点を確認するためにウェブアプリをリロードしてみてください。

```
terraform apply -auto-approve -var height=600 -var width=800
```

次に、Terraformが読める環境変数を設定してみます。このコマンドを実行してplaceholder変数を設定します。

```
export TF_VAR_placeholder=placedog.net
```

別の `terraform apply -auto-approve` コマンドを実行する。

```
terraform apply -auto-approve
```

同じ変数をコマンドラインで違う値に設定して、もう一度試してみてください。

```
terraform apply -auto-approve -var placeholder=placebear.com
```

どの変数が優先されましたか？