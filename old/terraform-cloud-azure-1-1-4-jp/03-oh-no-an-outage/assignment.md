---
slug: oh-no-an-outage
id: vd8mk0y2odcn
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
    のステートファイルが Lars のラップトップに保存されていたため、ウェブサイトの再構築に問題が発生したんだ。しかも、Lars は今日から2週間休暇なんだ。こんなことが二度と起こらないように、このアプリケーションにリモートステートを設定するのを手伝ってくれないか？"
tabs:
- title: Shell
  type: terminal
  hostname: workstation
- title: Code Editor
  type: code
  hostname: workstation
  path: /root/hashicat-azure
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
3. **hashicat-azure** という名前のワークスペースで、**Execution Mode** を **Local** (Remote ではない) に設定します。<br>
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

次に、`terraform.tfvars` ファイルを編集します。

`prefix` をあなたの名前（名字と名前の間にハイフンがあってもなくてもよく、すべて小文字で記入します）に、

**prefix 文字列はすべて小文字で、5～12　文字の間にしてください。prefix にアンダースコアは使用しないでください**

`prefix` はアプリケーションのホスト名の一部となるため、DNS に準拠したものである必要があります。

ホスト名に有効な文字は、ASCII(7) の a から z までの文字、0 から 9 までの数字、およびハイフン(-)です。 ホスト名はハイフンで始めてはいけません。

次に、`location` に "East US", "Central US", "UK South", "Southeast Asia" など、あなたの近くの有効な Azure のロケーションを設定します。

“eastus”, "centralus”, ”uksouth”, ”southeastasia" といった短い名前も使えます。

実際、Terraform はスペース付きの長い名前を、スペースなしの短い名前に変換してくれます。

東京リージョンを利用する場合は、`japaneast` と指定します。

有効な Azure ロケーションの一覧はこちらの[ページ](https://azure.microsoft.com/en-us/global-infrastructure/geographies/)をご覧ください(スペース付きの長い名前が表示されます)。

`prefix`, `location` のそれぞれの行から `#` を削除して、変数の値をアンコメントします。

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
Apply complete! Resources: 9 added, 0 changed, 0 destroyed.

Outputs:
catapp_ip = "http://"
catapp_url = http://sean-carolan-meow.centralus.cloudapp.azure.com
```

Step 6: Confirm catapp
=============================

URL をクリックして、アプリケーションが動作するかどうかをテストしてください。

もしロードされない場合は、`terraform apply` コマンドを再度実行してください。通常はこれで解決します。

```bash
terraform apply
```

`catapp_ip` の output に有効な値を表示するには、まず `terraform refresh` を実行する必要がある場合があります。

```bash
terraform refresh
```

さらに、Terraform Cloud のワークスペースの「States」タブに新しいステートファイルが表示されているはずです。

**注:** リモートバックエンドを設定する前にローカルで terraform を実行した場合、`terraform.tfstate` というローカルのステートファイルがあるかもしれません。その場合は、`rm terraform.tfstate` を実行して削除してください。

ウェブブラウザで hashicat アプリケーションをご覧になりたい場合は、Terraform Run (`terraform apply`) のアウトプットからリンクをコピーして、別のタブまたはウィンドウの URL バーに貼り付けてください。

---

リモートステートを有効にした hashicat アプリケーションのデプロイに成功したら、下の **Check** ボタンで Robin に報告してください。