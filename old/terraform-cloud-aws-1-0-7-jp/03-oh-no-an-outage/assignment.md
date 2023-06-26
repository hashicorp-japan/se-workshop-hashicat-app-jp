---
slug: oh-no-an-outage
id: qmawegxm5kum
type: challenge
title: "\U0001F4D2 Safekeeping Your Terraform State"
teaser: |
  予期せぬ停電により、本番 Web サイトの1つがダウンしてしまいました。

  Terraform のステートファイルが誰かのラップトップに保存されていたため、復旧には予想以上に時間がかかりました。

  Terraform Cloud のリモートステート機能が役に立ちます。
notes:
- type: text
  contents: "月曜日の朝、あなたはオフィスに一番乗りしました。チームメイトのほとんどは、昨夜の障害対応で遅くまで起きていました。そんな中 Senior
    operations admin の Robin があなたのデスクに現れました。\n\n>\U0001F9D3 君に手伝ってもらいたいことがあるんだ。昨晩、Terraform
    のステートファイルが Lars のラップトップに保存されていたため、ウェブサイトの再構築に問題が発生したんだ。しかも、Lars は今日から 2 週間休暇なんだ。こんなことが二度と起こらないように、このアプリケーションにリモートステートを設定するのを手伝ってくれないか？"
tabs:
- title: Shell
  type: terminal
  hostname: workstation
- title: Code Editor
  type: code
  hostname: workstation
  path: /root/hashicat-aws
- title: Credentials File
  type: code
  hostname: workstation
  path: /root/.terraform.d/credentials.tfrc.json
difficulty: basic
timelimit: 1800
---
ここでのチャレンジは、Terraform Cloud アカウントを使用してリモートステートを設定することです。

このチャレンジを完了するためには、以下のものが必要になります。

1. 無料の Terraform Cloud アカウント - https://app.terraform.io<br>
2. **YOURNAME-training** という Organization。これは前の演習で作成したものになります。<br>
3. **hashicat-aws** という名前のワークスペースで、**Execution Mode** を **Local** (Remote ではない) に設定します。<br>
4. 認証用の **user** トークン<br>
5. ワークスペースに保存されている `remote_backend` の設定。<br>

Step 1: Create Terraform Cloud user token
=============================

ワークステーションで使用する新しい **User token** を生成してみましょう。

Terraform Cloud の **User Settings** > **Tokens** (Terraform UI の User アイコンをクリック) ページにアクセスします。

https://app.terraform.io/app/settings/tokens

**Create an API token** ボタンをクリックします。

トークンには好きな名前をつけることができます。

トークン全体をマウスまたは小さなコピーペーストアイコンでコピーします。

Step 2: Configure Terraform Cloud API token
=============================

Instruqt トラックに戻って、API トークンを `credentials.tfrc.json` というファイルに追加します。

「Credentials File」 タブを選択し、`/root/.terraform.d/credentials.tfrc.json` ファイルを直接開きます。

`YOURTOKEN` と書かれている部分を Terraform Cloud からコピーしたものに置き換えます。

**必ずファイルを保存してください。**

ファイルの右隣にあるフロッピーディスクのアイコン 💾 をクリックして、ファイルを保存します。

これでトークンが `credentials.tfrc.json` ファイルに安全に保存されました。

Step 3: Modify remote_backend.tf
=============================

「Code Editor」 タブに戻り、`remote_backend.tf` ファイルを編集し、`YOUR Organization` プレースホルダーをご自身の Organization 名に置き換えます。

**修正したら、必ずファイルを保存してください。**

ファイルの右隣にあるフロッピーディスクのアイコン 💾 をクリックして、ファイルを保存します。

Step 4: Modify terraform.tfvars
=============================

次に、`terraform.tfvars` ファイルを編集して、`prefix` をあなたの名前（名字と名前の間にハイフンがあってもなくてもよく、すべて小文字）に、`region` を "us-east-1", "us-west-1", "eu-west-2", "ap-northeast-1" のような有効な AWS リージョンに設定してください。

有効な AWS リージョンのリストは、この[ページ](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-available-regions)をご参照ください。

`prefix`, `region` の各行から `#` を削除して、変数の値のコメントを解除します。

**修正したら、必ずファイルを保存してください。**

ファイルの右隣にあるフロッピーディスクのアイコン 💾 をクリックして、ファイルを保存します。

変数は実際には `variables.tf` ファイルで宣言されています。`terraform.tfvars` ファイルは、それらの値を設定するために使われています。

Step 5: Run teffaform cli
=============================

すべての要素がそろったら、「Shell」 タブで `terraform init` と `terraform apply` コマンドを実行してみてください。

```bash
terraform init
terraform apply
```

Terraform から apply の確認を求められたら、「Shell」 タブで `yes` と入力することを忘れないでください。

`terraform apply` が終了すると、以下のような出力が表示されるはずです。

```text
Apply complete! Resources: 13 added, 0 changed, 0 destroyed.

Outputs:
catapp_ip = "http://52.0.34.113"
catapp_url = http://ec2-107-22-209-41.compute-1.amazonaws.com
```

Step 6: Confirm catapp
=============================

URL をクリックして、アプリケーションが動作するかどうかをテストしてください。

もしロードされない場合は、`terraform apply` コマンドを再度実行してください。通常はこれで解決します。

`catapp_ip` の output に有効な値を表示するには、まず `terraform refresh` を実行する必要がある場合があります。

さらに、Terraform Cloud のワークスペースの「States」タブに新しいステートファイルが表示されているはずです。

**注:** リモートバックエンドを設定する前にローカルで terraform を実行した場合、`terraform.tfstate` というローカルのステートファイルがあるかもしれません。その場合は、`rm terraform.tfstate` を実行して削除してください。

ウェブブラウザで hashicat アプリケーションをご覧になりたい場合は、Terraform Run (`terraform apply`) のアウトプットからリンクをコピーして、別のタブまたはウィンドウの URL バーに貼り付けてください。

---

リモートステートを有効にした hashicat アプリケーションのデプロイに成功したら、下の **Check** ボタンで Robin に報告してください。