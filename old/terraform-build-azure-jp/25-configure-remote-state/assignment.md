---
slug: configure-remote-state
id: wnmbtx9mpgpt
type: challenge
title: "\U0001F39B️ リモートステートの設定"
teaser: Terraformコマンドラインツールは、その状態をTerraform Cloudに保存することができます。 必要なのはユーザートークンだけです。
notes:
- type: text
  contents: |-
    *ローカル実行モード*では、Terraformのコマンドと変数はすべてワークステーション上で実行されます。

    *リモート実行モード*では、TerraformはTerraform Cloudコンテナ環境で実行されます。この方法では、すべての変数はクラウド環境で設定する必要があります。
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
この課題では、Terraform Cloud をリモートステートバックエンドとして設定し、既存のステートファイルを Terraform Cloud に移行します。

*remote_backend.tf* ファイルを編集し、YOURORGANIZATION と YOURWORKSPACE のプレースホルダをOrganization名とワークスペース名に置き換えます。（ファイルがない場合はファイルを作成します。下記をコピー・アンド・ペーストして新しくremote_backend.tf ファイルをコードエディタで作成してください）

```
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "YOURORGANIZATION"
    workspaces {
      name = "YOURWORKSPACE"
    }
  }
}
```

ワークステーションで使用するための新しい **ユーザートークン** を生成してみましょう。Terraform Cloud の User Settings > Tokens ページにアクセスします。

https://app.terraform.io/app/settings/tokens

**APIトークンの作成**ボタンをクリックします。トークンには好きな名前を付けることができます。マウスまたは小さなコピーペーストアイコンを使用して、トークン全体をコピーします。

次に、 Instruqt ワークステーションのコードエディタに戻り、`/root/.terraform.d/credentials.tfrc.json` ファイルを開きます。YOURTOKENの部分をTerraform Cloudからコピーしたものに置き換えます。ファイルを閉じます。

これでトークンは `/root/.terraform.d/credentials.tfrc.json` ファイルに安全に保存されました。

ここで `terraform init` を実行して、状態をTerraform Cloudに移行します。

```
terraform init
```
<br>
ステートをTerraform Cloudに移行するように促されるので、"yes "と入力します。

これでステートは安全にTerraform Cloudに保存されます。

*terraform apply -auto-approve* を実行して、変更のたびに変化するステートファイルを確認してください。また、Terraform Cloud UIを使って、以前のステートファイルを参照することができます。