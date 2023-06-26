---
slug: api-driven-workflows
id: rwg5hxuox6jl
type: challenge
title: "\U0001F517 API Driven Workflows"
teaser: |
  Terraform Cloud には、外部システムとの連携に利用できる機能満載の RESTful API があります。これからの時代、GUI は必要ありません!
notes:
- type: text
  contents: "インフラの構築には、Terraform Cloud の Web UI やコマンドラインインターフェイス (CLI) を使うことがほとんどです。DevOps
    チームは API を介して CI/CD ツールと統合する必要があります。Lars からチャットメッセージが届きます。\n\n>\U0001F468\U0001F3FB‍\U0001F9B2
    上級システム管理者の皆さん、開発者がアプリケーションコードのテストに使っている新しい継続的インテグレーションツールがあります。私たちの Terraform
    Cloud の Organization とワークスペースへの API コールをテストしてもらいたいと思います。これを見て、API がどのように動作するかを学んでもらえますか？"
- type: text
  contents: |-
    行き詰まりを感じていますか？ Terraform Cloud のドキュメントには、すべての API エンドポイントの例が記載されています。
    https://www.terraform.io/docs/cloud/api/workspace-variables.html#create-a-variable<br>
    https://www.terraform.io/docs/cloud/api/run.html#create-a-run
- type: text
  contents: |-
    ここでは、*placeholder* 変数を使って試せる、他の楽しいプレースホルダーサイトをご紹介します。<br>

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
timelimit: 1800
---
最後のチャレンジでは、Terraform Cloud の API を直接操作します。

Terraform Cloud には豊富な API があり、GUI でできることはすべて、それ以上のことができます。

中/上級者は API を活用して、外部システムと連携する複雑なインテグレーションを作成します。

今回の目的は、API のみで、`hashicat-aws` ワークスペースで 3 つの変数を設定し、Terraform の実行をトリガーすることです。

設定する必要のある 3 つの変数は以下の通りです。

- `placeholder` 画像のプレースホルダーの URL です。例: placekitten.com, placedog.net, picsum.photos
- `height` 画像の高さをピクセルで指定します。600 に設定してください。
- `width` 画像の幅をピクセル単位で指定します。800 に設定してください。

3 つの変数をすでに UI で設定している場合は、チャレンジを始める前に削除してください。

Step 1: Prepare for API operation
=============================

まず、「Shell」タブで、以下のコマンドを実行して Terraform Cloud の API トークンを取得し、環境変数 `TOKEN` に格納します。

```bash
export TOKEN=$(grep token /root/.terraform.d/credentials.tfrc.json | cut -d '"' -f4)
```

次に、`MYORGNAME` を自分の Organization 名に置き換えて、以下のコマンドで `ORG` 変数を設定します。

```bash
export ORG="MYORGNAME"
```

最後に、次の `curl` コマンドでワークスペース ID を取得します。

`cURL` は、API と直接やりとりするのに便利なコマンドラインツールです。`TOKEN` 変数と `ORG` 変数がコマンドに自動的に埋め込まれていることに注意してください。

```bash
curl -s --header "Authorization: Bearer $TOKEN" --header "Content-Type: application/vnd.api+json" https://app.terraform.io/api/v2/organizations/$ORG/workspaces/hashicat-aws | jq -r .data.id
```

出力されたワークスペース ID を変数 `WS_ID` に設定しておきます。

```bash
export WS_ID="WORKSPACEID"
```

このワークスペース ID は、この後のチャレンジ中に必要になります。

Step 2: Modify payload json files
=============================

`json` ディレクトリにある 4 つの `*.json` ファイルを使って、変数を作成し、Terraform の plan / apply を起動します。

どのコマンドを実行するかは、Terraform API のドキュメント（このチャレンジのノートの 1 つにあります）を使用します。

  - [Workspace Variables API - Create a Variable](https://www.terraform.io/cloud-docs/api-docs/workspace-variables#create-a-variable)

まずは、「Code Editor」タブから 4 つのファイルを編集します。

各ファイルで `REPLACE_*` となっている部分を修正します。ここでワークスペース ID が必要になります。

**ファイルを修正したら、必ず保存してください。** ファイルの右隣にあるフロッピーディスクのアイコン 💾 をクリックして、ファイルを保存します。

Step 3: Run Terraform Cloud API
=============================

ファイルを修正出来たら、Terraform Cloud API を実行し、変数を設定し、Terraform Run を実行します。

関連する `curl` リクエストの手順は、以下で確認する事ができます。

- [For workspace variables](https://www.terraform.io/docs/cloud/api/workspace-variables.html#sample-request)
- [To apply runs](https://www.terraform.io/docs/cloud/api/run.html#sample-request)

ワークスペース変数の設定に関しては、「Shell」タブで以下のコマンドで行う事が出来ます。

JSON ファイル名の前に `@` を必ず入れてください。

`placeholder` 変数の設定

```bash
curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @var-placeholder.json \
  https://app.terraform.io/api/v2/workspaces/$WS_ID/vars | jq
```

`height` 変数の設定

```bash
curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @var-height.json \
  https://app.terraform.io/api/v2/workspaces/$WS_ID/vars | jq
```

`width` 変数の設定

```bash
curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @var-width.json \
  https://app.terraform.io/api/v2/workspaces/$WS_ID/vars | jq
```

Step 4: Confirm variables on Terraform Cloud
=============================

正しく処理が完了したら、Terraform Cloud の UI からワークスペース `hashicat-aws` の Variables で環境変数が設定されている事を確認します。

Step 5: Terraform Run with Terraform Cloud API
=============================

最後に、Terraform Run を実行します。

```bash
curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @apply.json \
  https://app.terraform.io/api/v2/runs | jq
```

新しい変数を使用して、API 経由で Terraform Run を正常にトリガー出来たら、**Check** ボタンをクリックして続行します。