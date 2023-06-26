---
slug: api-driven-workflows
id: ig0eb5c1ggom
type: challenge
title: "\U0001F517 API Driven Workflows"
teaser: |
  Terraform Cloudには、外部システムとの連携に利用できる機能満載のRESTful APIがあります。これからの時代、GUIは必要ありません!
notes:
- type: text
  contents: "Terraform CloudのWeb UIやコマンドラインインターフェイス（CLI）を使ってインフラを構築することがほとんどです。開発チームは、APIを介してCI/CDツールと統合する必要があります。Larsからチャットメッセージが届きました。:\n\n>\U0001F468\U0001F3FB‍\U0001F9B2
    私たちは開発者がアプリケーションコードをテストするために使っている新しいCIツールを持っています。私たちのTerraform Cloudの Organization
    とワークスペースへのAPIコールをテストしてもらいたいと思います。これを見て、APIがどのように動作するかを学んでもらえますか?"
- type: text
  contents: |-
    Feeling stuck? Remember that the Terraform Cloud docs contain examples for all API endpoints:
    https://www.terraform.io/docs/cloud/api/variables.html#create-a-variable
    https://www.terraform.io/docs/cloud/api/run.html#create-a-run
- type: text
  contents: |-
    Here are some other fun placeholder sites you can try with the *placeholder* variable:
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
  path: /root/hashicat-aws
- title: Shell
  type: terminal
  hostname: workstation
- title: Terraform Cloud
  type: external
  url: https://app.terraform.io
difficulty: basic
timelimit: 1800
---
最後のチャレンジでは、Terraform Cloud の API を直接操作します。Terraform Cloud には豊富な API があり、GUI でできることはすべて、それ以上のことができます。中・上級者は API を活用して、外部システムと連携する複雑なインテグレーションを作成します。

今回の目的は、hashicat-aws のワークスペースで3つの変数を設定し、API のみで Terraform の run をトリガーすることです。設定する必要のある3つの変数は以下の通りです。
- `placeholder` 画像のプレースホルダーのURLです。例：placekitten.com, placedog.net, picsum.photos
- `height` 画像の高さをピクセルで指定します。600に設定してください。
- `width` 画像の幅をピクセル単位で指定します。800に設定してください。

3つの変数をすでにUIで設定している場合は、チャレンジを始める前に削除してください。
### チャレンジのセットアップ。
以下のコマンドを実行してトークンを取得し、環境変数 TOKEN に格納します。
```
export TOKEN=$(grep token /root/.terraform.d/credentials.tfrc.json | cut -d '"' -f4)
```
次に、MYORGNAME をご自身の ORG に置き換えて、以下のコマンドで ORG 変数を設定します。
```
export ORG="MYORGNAME"
```
最後に、次の curl コマンドでワークスペースID を取得します。curl は、API と直接やりとりするのに便利なコマンドラインツールです。TOKEN 変数と ORG 変数がコマンドに自動的に埋め込まれていることに注意してください。
```
curl -s --header "Authorization: Bearer $TOKEN" --header "Content-Type: application/vnd.api+json" https://app.terraform.io/api/v2/organizations/$ORG/workspaces/hashicat-aws | jq -r .data.id
```
このワークスペースID は、チャレンジ中に必要になるので、どこかにコピーまたは保存しておいてください。
### チャレンジ:
json ディレクトリにある4つの*.jsonファイルを使って、変数を作成し、Terraformのplan/applyを起動します。どのコマンドを実行するかは、Terraform APIのドキュメント（このチャレンジのノートの1つにあります）を使用します。テキストエディターでファイルを編集して、ワークスペース用にカスタマイズすることができます。JSON ファイル名の前に `@` を必ず入れてください。

関連するcurl リクエストの手順は、ここで確認できます。
- [For workspace variables](https://www.terraform.io/docs/cloud/api/workspace-variables.html#sample-request)
- [To apply runs](https://www.terraform.io/docs/cloud/api/run.html#sample-request)

ヒント: グローバル検索と置換 (虫眼鏡のアイコン) を使用すると、ワークスペース内のすべてのファイルのテキストを一度に置換できます。

新しい変数を使用してAPI経由でランを正常に起動したら、**Check**ボタンをクリックして続行します。