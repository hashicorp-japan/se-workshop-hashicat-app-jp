---
slug: terraform-cloud-setup
id: hui00ekpb4j9
type: challenge
title: ☁️ Terraform Cloud Setup
teaser: |
  Terraform Cloud は、ユーザーに無料 Terraform ステートストレージを提供します。Terraform Cloud にリモートで保存することで、お客様のステートファイルを保護します。
notes:
- type: text
  contents: Terraform Cloudのリモートステートは、すべてのユーザーが無料で利用できます。
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
difficulty: basic
timelimit: 1800
---
以下のURL からTerraform Cloud の無料アカウントに登録してください。

https://app.terraform.io/signup/account

すでにアカウントをお持ちの方は、既存の認証情報でサインインするだけです。

Terraform Cloud にサインインすると、いくつかのオプションがある画面が表示されます。「Not right now, skip questions」のリンクをクリックして、質問をスキップすることを確認してください。次に、YOURNAME-training　という新しい Organization を作成します。「YOURNAME」はご自身の名前などで置き換えてください。

次に、ワークスペースの作成を促されます。「CLI-driven workflow」パネルを選択し、「**hashicat-aws**」と入力して、「Create workspace」ボタンをクリックします。

ワークスペースの名前は必ず **hashicat-aws** にしてください。他の名前を付けようとしないでください。

**注意**： **hashicat-aws** ワークスペースをすでにお持ちの場合は、 **Setting >> Destruction and Deletion** メニューを選択し、"**Delete from Terraform Cloud**" ボタンをクリックし、"**hashicat-aws**" と入力して確認した後、"**Delete workspace**" ボタンをクリックして、ワークスペースを削除してください。その後、上記の方法で再作成してください。

この次のステップをスキップしないでください:

「**Shell**」タブで `terraform version` を実行し、ワークスペースの **Setting >> General** Setting ページで **Terraform Version** を一致させます。

次に、**Execution Mode** を **Local** に変更します。

ページの下にある　"**Save settings**" ボタンをクリックして、必ず設定を保存してください! これで、ローカル変数を使ってワークステーションからTerraform コマンドを実行できるようになります。

Terraform Cloud の「Team & Governance」プランの30日間無料トライアルを有効にするには、プロジェクトの Settings メニューから **Plan & Billing** に移動し、**Change Plan** を選択し、"Trial Plan" ラジオボタンを選択して、"Start your free trial" ボタンをクリックします。

また、すでにトライアルを利用したことのある既存のアカウントをお持ちの方は、インストラクターに Organization 名を伝えてください。講師はあなたの Organization をアップグレードして、すべての有料機能の30日間の無料トライアルのロックを解除します。

**Check** ボタンを押す前に、**Execution Mode** を **Local** に変更しましたか？Setting ページの下にある"**Save settings**" ボタンをクリックして、設定を保存しましたか？ これは見逃しがちなステップなので、2回言及しています。