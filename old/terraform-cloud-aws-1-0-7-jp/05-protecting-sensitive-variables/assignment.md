---
slug: protecting-sensitive-variables
id: q7we7t2mgweb
type: challenge
title: "\U0001F510 Securing Cloud Credentials"
teaser: |
  あなたのチームは AWS 上でクラウドインフラストラクチャの構築を開始しましたが、セキュリティチームは全員のクラウド認証情報へのアクセスに懸念を抱いています。
notes:
- type: text
  contents: "仕事を始めて数週間が経つと、あなたは物事のリズムをつかみ始めます。コードを書き、テストを行い、ウェブサイトをデプロイ。すべてが順調に進んでいましたが、誰かの
    AWS キーが誤ってパブリックのコードリポジトリにプッシュされてしまいました。ACME の情報セキュリティ管理者のリーダーである William からこんなメールが届きました。\n\n>\U0001F46E\U0001F3FF‍♂️
    こんにちは。昨夜、あなたのラップトップをリモートスキャンしたところ、セキュリティ保護されていない AWS アクセスキーがいくつか見つかりました。今日中にあなたのラップトップからそれらを移動し、Terraform
    Cloud に保管していただきたいのです。"
- type: text
  contents: "\U0001F914 知ってましたか?\n\n毎日何千もの API や暗号キー、シークレットが GitHub に流出しています！\n\nhttps://nakedsecurity.sophos.com/2019/03/25/thousands-of-coders-are-leaving-their-crown-jewels-exposed-on-github/\n\n
    Terraform Cloud は、キーをセンシティブな変数として保存すると、暗号化されて [HashiCorp Vault](https://www.vaultproject.io/)
    のインスタンスに保存されます。これらのキーは、Terraform コマンドを実行する信頼できる安全なインスタンス内でのみ復号されます。"
- type: text
  contents: "\U0001F469\U0001F3FC‍\U0001F4BB リモート実行、ローカルコード\n\n[リモート実行](https://www.terraform.io/cloud-docs/run/remote-operations)では、使い慣れた
    Terraform コマンドを使用することができますが、実行内容やすべての変数は Terraform Cloud のワークスペースに安全に保存されます。これは、もともと
    Terraform Open Source 用に書かれたツールをアップグレードする際に役立ちます。\n\nリモート実行では、Terraform のコードはローカルマシンに保存され、実行するたびにサーバーに送信されます。"
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
AWS クレデンシャルの問題を受けて、セキュリティチームは AWS アカウントへのアクセスを強化しています。

API クレデンシャルは、Terraform Cloud 上の変数として保護する必要があります。

あなたの仕事は、AWS のアクセスキー ID とシークレットアクセスキーを見つけて、安全な環境変数としてワークスペースに移動させることです。

アクセスキー ID はプレーンテキストの環境変数として、シークレットアクセスキーはセンシティブな環境変数として保存します。各変数にオプションの説明を入力することもできますが、これはこのチャレンジを完了するために必須ではありません。

このチャレンジを達成するためには、以下のことを行います。

Step 1: Look for AWS credential
=============================

「Sehll」タブで以下のコマンドを実行して、AWS の認証情報を検索します。

```bash
echo $AWS_ACCESS_KEY_ID
echo $AWS_SECRET_ACCESS_KEY
```

Step 2: Change exec mode in Terraform Cloud
=============================

Terraform Cloud で作業を行なって行きます。

Terraform Cloud 上のワークスペース `hashicat-aws` の **Settings** > **General** で、**Execution Mode** の設定を **Remote** に更新します。

Step 3: Change apply method in Terraform Cloud
=============================

同じページで **Apply Method** を **Auto apply** に変更します。

これにより、Terraform の実行を毎回手動で承認する手間が省けます。

ページの下にある **Save settings** ボタンを忘れずにクリックしてください！

Step 4: Configure environment variables in Terraform Cloud
=============================

ワークスペース `hashicat-aws` の **Variables** で、AWS の認証情報のための **Environment Variables** を設定します。

**+ Add variable** をクリックし、AWS の認証情報を入力します。

"Key" の値に `AWS_ACCESS_KEY_ID` を入力し、"Value" に `echo` コマンドで確認した実際の値を入力します。

**Select variable category** で **Environment variable** を選択し、**Save variable** ボタンをクリックします。

続いて、同じ様には `AWS_SECRET_ACCESS_KEY` に関しても入力していきます。

こちらは、**Sensitive** をチェックし、Write only な環境変数とします。

最後に、登録した 2 つの環境変数の **Category** カラムの値が全て **env** となっている事を確認して下さい。

Step 5: Configure terraform variables in Terraform Cloud
=============================

次に、`prefix` と `region` に **Terraform Variables** を設定します。

これらの変数の詳細については、「Code Editor」タブで `variables.tf` ファイルを参照してください。

すべてのリソースが破壊されて再作成されるのを避けるために、`terraform.tfvars` ファイルで使用したのと同じ値を設定してください（長く待つのが好きでなければ）。

**注:** これらの変数は、ローカルの `terraform.tfvars` ファイルからは読み込まれないので、*ワークスペースで設定する必要があります* 。

この Terraform コードは **us-east-1** リージョンでテストされています。

t2.micro インスタンスタイプをサポートしていないリージョンもありますのでご注意ください。

この制限に遭遇した場合は、リージョンを **us-east-1** に切り替えてください。

Step 6: Run terraform cli
=============================

「Shell」タブで、`terraform init` を実行して、作業をテストしてください。

```bash
terraform init
```

バックエンドの設定がリモート実行用に更新されます。

次に、`terraform plan` を実行してみてください。

```bash
terraform plan
```

これは [Speculative Plan](https://www.terraform.io/cloud-docs/run/remote-operations#speculative-plans) として知られているものを起動します。

このプランは、「Shell」タブからリンクをコピーすることで見ることができます。

このプランは、UI や API を介してトリガーされた通常の Terraform 実行では表示されません。プランの出力のコピーは、「Shell」タブにストリームバックされます。

次に、`terraform apply` を実行します。

この Apply は、**きっと** Terraform Cloud UI のワークスペース `hashicat-aws` の Runs ページで表示されるはずです。

```bash
terraform apply
```

「Shell」タブで引き続き `terraform plan` と `terraform apply` を実行することができますが、Terraform の実行は Terraform Cloud で行われます。

---

おめでとうございます！AWS の認証情報が安全に暗号化され、Terraform Cloud のワークスペースに保存されました。