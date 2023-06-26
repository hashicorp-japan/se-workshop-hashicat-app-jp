---
slug: terraform-cloud-setup
id: 7vicu6vymmd1
type: challenge
title: ☁️ Terraform Cloud Setup
teaser: |
  Terraform Cloud は、ユーザーに無料の Terraform ステートストレージを提供します。Terraform Cloud にリモートで保存することで、ステートファイルを暗号化し、セキュアに保護します。
notes:
- type: text
  contents: Terraform Cloud の[リモートステート](https://www.terraform.io/cloud-docs/workspaces/state)は、すべてのユーザーが無料で利用できます。
tabs:
- title: Shell
  type: terminal
  hostname: workstation
- title: Code Editor
  type: code
  hostname: workstation
  path: /root/hashicat-azure
difficulty: basic
timelimit: 1800
---
以下の URL から Terraform Cloud の無料アカウントに登録してください。

https://app.terraform.io/signup/account

Step 1: Sign in Terraform Cloud
=============================

すでにアカウントをお持ちの方は、既存の認証情報でサインインするだけです。

Terraform Cloud にサインインすると、いくつかのオプションがある画面が表示されます。

「Not right now, skip questions」 または、「Start from Scratch」 のリンクをクリックして、質問をスキップしてください。

Step 2: Create Organization
=============================

次に、`YOURNAME-training` という新しい Organization を作成します。

`YOURNAME` はご自身の名前などで置き換えてください。

Step 3: Create Workspace
=============================

次に、ワークスペースの作成を促されます。

「CLI-driven workflow」パネルを選択し、`hashicat-azure` と入力して、「Create workspace」ボタンをクリックします。

**注:** ワークスペースの名前は必ず `hashicat-azure` にしてください。他の名前を付けようとしないでください。

**Note:** すでに `hashicat-azure` ワークスペースをお持ちの場合は、 `hashicat-azure` ワークスペースの **Settings** > **Destruction and Deletion** メニューを選択し、「Delete from Terraform Cloud」 ボタンをクリックし、`hashicat-azure` と入力して確認した後、「Delete workspace」 ボタンをクリックして、ワークスペースを削除してください。その後、上記の方法で再作成してください。

この次のステップは、スキップしないでください。

Step 4: Setup Workspace configuration
=============================

「Shell」タブで `terraform version` を実行し、ワークスペースの **Settings** > **General Settings** ページで **Terraform Version** を一致させます。

また、同じページ内で、**Execution Mode** を **Local** に変更します。

**ページの下にある「Save settings」ボタンをクリックして、必ず設定を保存してください!**

これで、ローカル変数を使ってワークステーションから Terraform コマンドを実行できるようになります。

Step 5: Change Terraform Cloud plan
=============================

Terraform Cloud の「Team & Governance」プランの 30 日間無料トライアルを有効にするには、Organization の **Settings** メニューから **Plan & billing** に移動し、**Change plan** を選択し、**Trial Plan** ラジオボタンを選択して、「Start your free trial」ボタンをクリックします。

**Note:** Terraform Cloud UI の左側に **Manage** パネルがない場合、Organization の **Settings** メニューは、Terraform Cloud UI の上部, 紫背景に白文字の **Settings** メニューを選択します。

また、すでにトライアルを利用したことのある既存のアカウントをお持ちの方は、インストラクターに Organization 名を伝えてください。

インストラクターはあなたの Organization をアップグレードして、すべての有料機能の 30 日間の無料トライアルのロックを解除します。

---

**Check** ボタンを押す前に、**Execution Mode** を **Local** に変更しましたか？ これは見逃しがちなステップなので、2 回言及しています。

**Execution Mode** を **Local** に変更しておかないと、次のチャレンジが上手くいかないため、確認しておいて下さい。