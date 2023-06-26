---
slug: protecting-sensitive-variables
id: pebsotamdipm
type: challenge
title: "\U0001F510 Securing Cloud Credentials"
teaser: |
  あなたのチームは AWS 上でクラウドインフラストラクチャの構築を開始しましたが、セキュリティチームは全員の AWS のクレデンシャル情報へのアクセスを保護することに懸念を抱いています。
notes:
- type: text
  contents: "仕事を始めてから数週間が経ち、あなたは物事のリズムをつかみ始めています。コードを書き、テストを行い、ウェブサイトをデプロイする。すべてが順調に進んでいたのですが、ある人のAWSキーが誤ってパブリックのコードリポジトリにプッシュされてしまいました。ACMEのlead
    infosec admin であるWilliam からこんなメールが届きました。\n\n>\U0001F46E\U0001F3FF‍♂️ 昨夜、あなたのラップトップをリモートスキャンしたところ、セキュリティ保護されていないAWS
    アクセスキーがいくつか見つかりました。今日中にあなたのラップトップからそれらをTerraform Cloud に移動し、Terraform Cloud で保管するようにして下さい。"
- type: text
  contents: "\U0001F914 ご存知ですか?\n\n毎日何千ものAPIや暗号鍵がGitHubに流出している事を!\n\nhttps://nakedsecurity.sophos.com/2019/03/25/thousands-of-coders-are-leaving-their-crown-jewels-exposed-on-github/\n\nTerraform
    Cloud でAPI キーをセンシティブな変数として保存すると、暗号化されてHashiCorp Vault のインスタンスに保存されます。これらのキーは、Terraform
    コマンドを実行する信頼できる安全なWorker インスタンスでのみ復号化されます。"
- type: text
  contents: "\U0001F469\U0001F3FC‍\U0001F4BB Remote Execution, Local Code\n\nリモート実行では、使い慣れたTerraform
    のコマンドを使用できますが、実行内容やすべての変数はTerraform Cloud のワークスペースに安全に保存されます。これは、元々Terraform Open
    Source 用に書かれたツールをアップグレードする際に役立ちます。\n\nリモート実行では、Terraform のコードはローカルマシンに保存されたままで、実行するたびにTerraform
    Cloud に送信されます。"
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
AWS のクレデンシャルの問題を受けて、セキュリティチームはAWS アカウントへのアクセスを強化しています。API キーはTerraform Cloud のストアード変数として保護する必要があります。あなたの仕事は、AWS のアクセスキーID とシークレットアクセスキーを見つけて、安全な環境変数としてワークスペースに移動することです。アクセスキーID はプレーンテキストの環境変数として、シークレットアクセスキーはセンシティブの環境変数として保存します。各変数にオプションの説明を入力することもできますが、これはこのチャレンジを完了するために必須ではありません。

このチャレンジを達成するためには、以下のことを行う必要があります。

1. 「Shell」タブから、以下のコマンドでAWS のクレデンシャル情報を見つけます。

```
echo $AWS_ACCESS_KEY_ID
echo $AWS_SECRET_ACCESS_KEY
```
2. Terraform Cloud のワークスペースの「Setting」->「General」タブで、「Execution Mode」の設定を「Remote」に変更します。
3. 同じページの**Apply Method** を「Auto apply」に変更します。これにより、Terraform の実行を毎回手動で承認する手間が省けます。ページの下にある**Save**ボタンを忘れずにクリックしてください。
4. Terraform Cloud のワークスペースの「Variables」タブで、AWS のクレデンシャル情報のための「Environment Variables」を設定します。*AWS_ACCESS_KEY_ID* は通常の環境変数として保存しますが、*AWS_SECRET_ACCESS_KEY* は機密扱い(Sensitive にチェックを入れる)とします。
5. 同じ「Variables」タブにある、「Terraform Variables」 で、`prefix` と `region` の変数を設定します。これらの変数の詳細については、エディターから`variables.tf`　ファイルを参照してください。すべてのリソースが破壊されて再作成されるのを避けるために、`terraform.tfvars` ファイルで使用したのと同じ値を設定してください（より長く待ちたい場合は別です）。注：これらの変数は、ローカルの `terraform.tfvars` ファイルからは読み込まれないので、ワークスペース上で設定する必要があります。
6. このコードは **us-east-1** 地域でテストされています。t2.microインスタンスタイプをサポートしていないリージョンもありますのでご注意ください。これに遭遇した場合は、リージョンを `us-east-1` に切り替えてください。

`terraform init` を実行します。バックエンドの設定がリモート実行用に更新されます。

次に `terraform plan` を実行してみてください。このplan は、「Shell」タブで出力されるリンクをコピーするか、VS Code　エディタのターミナルから見ることができます。このplanは、UIやAPIで起動した通常のTerraform の実行では表示されません。plan の出力のコピーは、"Shell "タブにストリームバックされます。

`terraform apply` を実行します。このapply は、Terraform Cloud UI のrun ページに移動すると表示されます。

```
terraform apply
```

おめでとうございます！AWS のキーが安全に暗号化され、Terraform Cloud のワークスペースに保存されました。

「Shell」タブで引き続き、`terraform plan` と`terraform apply` を実行することができますが、実行はTerraform Cloud で行われるようになります。