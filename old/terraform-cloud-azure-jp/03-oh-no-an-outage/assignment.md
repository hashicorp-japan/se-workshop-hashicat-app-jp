---
slug: oh-no-an-outage
id: dnsfjbgyk0fm
type: challenge
title: "\U0001F4D2 Terraformのステートファイルを守る！"
teaser: |
  予期せぬ停電により、本番 Web サイトの1つがダウンしてしまいました。Terraform のステートファイルが誰かのラップトップに保存されていたため、復旧には予想以上に時間がかかりました。Terraform Cloud のリモートステート機能が役に立ちます。
notes:
- type: text
  contents: "月曜日の朝、あなたはオフィスに一番乗りしました。チームメイトのほとんどは、昨夜の障害対応で遅くまで起きていました。そんな中Senior operations
    admin のRobin があなたのデスクに現れました。\n\n>\U0001F9D3 君に手伝ってもらいたいことがあるんだ。昨晩、Terraform のステートファイルがLars
    のラップトップに保存されていたため、ウェブサイトの再構築に問題が発生したんだ。しかも、Lars は今日から2週間休暇なんだ。こんなことが二度と起こらないように、このアプリケーションにリモートステートを設定するのを手伝ってくれないか？"
tabs:
- title: Text Editor
  type: code
  hostname: workstation
  path: /root/hashicat-azure
- title: VS Code Editor
  type: service
  hostname: workstation
  port: 8443
- title: Credentials File
  type: code
  hostname: workstation
  path: /root/.terraform.d/credentials.tfrc.json
- title: Shell
  type: terminal
  hostname: workstation
difficulty: basic
timelimit: 1800
---
ここでのチャレンジは、Terraform Cloud アカウントを使用してリモートステートを設定することです。このチャレンジを完了するためには、以下のものが必要です。

1. 無料のTerraform Cloudアカウント - https://app.terraform.io<br>
2. **yourname-training**という Organization。これは前の演習で作成したものになります。<br>
3. **hashicat-azure**という名前のワークスペースで、**Execution Mode** を**Local**（Remoteではない）に設定します。<br>
4. 認証用の*User*トークン<br>
5. ワークスペースに保存されている`remote_backend` の設定。<br>

ワークステーションで使用する新しい**User　トークン**を生成してみましょう。Terraform Cloudの「User Settings > Tokens」ページにアクセスします。

https://app.terraform.io/app/settings/tokens

**Create an API token**ボタンをクリックします。トークンには好きな名前をつけることができます。トークン全体をマウスまたは小さなコピーペーストアイコンでコピーします。

Instruqt トラックに戻って、API トークンを`credentials.tfrc.json` というファイルに追加します。

「Credentials File」 タブを選択し、`/root/.terraform.d/credentials.tfrc.json` ファイルを直接開くことが出来ます。

`YOURTOKEN` と書かれている部分をTerraform Cloud からコピーしたものに置き換えます。「Credentials File」 タブを使用する場合は、必ずファイルを保存してください。

これでトークンが`credentials.tfrc.json` ファイルに安全に保存されました。

エディターに戻り、`remote_backend.tf` ファイルを編集し、"YOUR Organization " プレースホルダーをご自身のOrganization　名に置き換えます。


エディターで、`terraform.tfvars` ファイルを編集して、`prefix`をあなたの名前（名字と名前の間にハイフンがあってもなくてもよく、すべて小文字）にしてください。
`prefix`はホストネームとして利用されるので、DNSセーフな文字列にしてください。アンダースコアなどは使わないでください。

`location`を "East US"、"Japan East"、"Japan West"のような有効なAzure locationに設定してください。

各行から「#」を削除して、変数の値のコメントを解除します。

変数は実際には `variables.tf` ファイルで宣言されています。`terraform.tfvars` ファイルは、それらの値を設定するために使われているだけです。

すべての要素がそろったら、「Shell」タブで`terraform init`と`terraform apply`コマンドを実行してみてください。

```
terraform init
terraform apply
```

Terraform からapply　の確認を求められたら、"Shell "タブで*yes*と入力することを忘れないでください。

`terraform apply` が終了すると、以下のような出力が表示されるはずです。

```
Apply complete! Resources: 8 added, 0 changed, 0 destroyed.

Outputs:

catapp_url = http://masa-meow.japaneast.cloudapp.azure.com
```

URLをクリックして、アプリケーションが動作するかどうかをテストしてください。もしロードされない場合は、`terraform apply`コマンドを再度実行してください。通常はこれで解決します。

さらに、Terraform Cloudのワークスペースの"States" タブに新しいステートファイルが表示されているはずです。

注意：リモートバックエンドを設定する前にローカルでterraformを実行した場合、`terraform.tfstate`というローカルのステートファイルがあるかもしれません。その場合は、`rm terraform.tfstate`を実行して削除してください。

リモートステートを有効にした hashicat アプリケーションのデプロイに成功したら、下の**Check** ボタンを押して下さい。

ウェブブラウザで hashicat アプリケーションをご覧になりたい場合は、Terraform 実行の出力結果からリンクをコピーして、別のタブまたはウィンドウのURLバーに貼り付けてください。