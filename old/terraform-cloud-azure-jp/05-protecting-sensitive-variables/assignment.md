---
slug: protecting-sensitive-variables
id: qayytk9qwslp
type: challenge
title: "\U0001F510 クラウドクレデンシャルを守る！"
teaser: |
  あなたのチームは Azure 上でクラウドインフラストラクチャの構築を開始しましたが、セキュリティチームは全員の Azure のクレデンシャル情報へのアクセスを保護することに懸念を抱いています。
notes:
- type: text
  contents: "仕事を始めてから数週間が経ち、あなたは物事のリズムをつかみ始めています。コードを書き、テストを行い、ウェブサイトをデプロイする。すべてが順調に進んでいたのですが、ある人のAzureクレデンシャルが誤ってパブリックのコードリポジトリにプッシュされてしまいました。ACMEのlead
    infosec admin であるWilliam からこんなメールが届きました。\n\n>\U0001F46E\U0001F3FF‍♂️ 昨夜、あなたのラップトップをリモートスキャンしたところ、セキュリティ保護されていないAzureのクレデンシャルがいくつか見つかりました。今日中にあなたのラップトップからそれらをTerraform
    Cloud に移動し、Terraform Cloud で保管するようにして下さい。"
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
- title: Text Editor
  type: code
  hostname: workstation
  path: /root/hashicat-azure
- title: VS Code Editor
  type: service
  hostname: workstation
  port: 8443
- title: Shell
  type: terminal
  hostname: workstation
- title: Terraform Cloud
  type: external
  url: https://app.terraform.io
difficulty: basic
timelimit: 1800
---
Azureのクレデンシャルの問題を受けて、セキュリティチームはAzureアカウントへのアクセスを強化しています。API キーはTerraform Cloud のストアード変数として保護する必要があります。あなたの仕事は、Azureのクレデンシャルを見つけて、安全な環境変数としてワークスペースに移動することです。各変数にオプションの説明を入力することもできますが、これはこのチャレンジを完了するために必須ではありません。

このチャレンジを達成するためには、以下のことを行う必要があります。

1. 「Shell」タブから、以下のコマンドでAzureのクレデンシャル情報を見つけます。

```
env | grep ARM
```

2. 必要となるクレデンシャルは `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_TENANT_ID`, and `ARM_SUBSCRIPTION_ID` の4つです。
3. ワークスペースのSetting -> Generalから `Excecution Mode` を `Remote` へ変更してください。
4. 同じページにある `Apply Method` を `Auto apply` へ変更してください。これにより、Terraform の実行を毎回手動で承認する手間が省けます。ページの下にある**Save**ボタンを忘れずにクリックしてください。
5. Variableタブに移動して、Environment variablesに上記のAzureクレデンシャルを設定してください。その際に **ARM_CLIENT_SECRET** に **Sensitive** のチェックを入れてください。 他の変数はプレーンテキストのままで問題ありません。
6. 同じページの **Terraform Variables** に`prefix`と`location`変数を設定してください。前のチャレンジで`terraform.tfvars`に設定した値と同じものを使用してください。これにより、ワークスペースに共通した変数を設定でき、各チームメンバーが個別にローカルで変数管理をする手間がなくなります。

`terraform init` を実行します。バックエンドの設定がリモート実行用に更新されます。

次に `terraform plan` を実行してみてください。このplan は、「Shell」タブで出力されるリンクをコピーするか、VS Code　エディタのターミナルから見ることができます。このplanは、UIやAPIで起動した通常のTerraform の実行では表示されません。plan の出力のコピーは、"Shell "タブにストリームバックされます。

`terraform apply` を実行します。このapply は、Terraform Cloud UI のrun ページに移動すると表示されます。

```
terraform apply
```

おめでとうございます！Azureのクレデンシャルが安全に暗号化され、Terraform Cloud のワークスペースに保存されました。

「Shell」タブで引き続き、`terraform plan` と`terraform apply` を実行することができますが、実行はTerraform Cloud で行われるようになります。