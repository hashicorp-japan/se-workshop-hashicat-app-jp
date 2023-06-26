---
slug: private-module-registry
id: 4ym9tdsxafqu
type: challenge
title: "\U0001F4DA Private Module Registry"
teaser: |
  ユーザーの中には、データベースとネットワークをデプロイする簡単な方法を求めている人もいるでしょう。[プライベート・モジュール・レジストリ](https://www.terraform.io/cloud-docs/registry)は、標準的で再利用可能な Terraform コードを保存し、他のユーザーが自分のワークスペースで使用できるようにします。
notes:
- type: text
  contents: "DevOps チームのほとんどが Terraform を使ってインフラを構築・設定しています。最近では、チーム外のユーザーから、自分のワークスペースの構築を手伝ってほしいという要望が寄せられています。
    データベース管理者である Gaurav は、昼食時にあなたを見かけ、助けを求めてきました。\n>\U0001F473\U0001F3FE‍♂️ こんにちは、Senior
    SysAdmin さん、たくさんの Azure ネットワークを設定する必要があるのですが、そのための Terraform モジュールがあると聞きました。hashicat-azure
    のワークスペースに新しいネットワークを設定するのを手伝ってもらえますか?"
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
このチャレンジでは、Terraform コードの再利用可能なモジュールを保存してバージョン管理できる、プライベートモジュールレジストリの使い方を学びます。

このモジュールをゼロから書く代わりに、パブリック Terraform レジストリから既存の Azure ネットワークモジュールをコピーすることができます。

この [URL](https://registry.terraform.io/modules/Azure/network/azurerm) にアクセスして Azure ネットワークモジュールを見てみてください。

Step 1: Fork repository
=============================

[このモジュール]((https://registry.terraform.io/modules/Azure/network/azurerm))の GitHub リポジトリを指す「Source Code」リンクに注目してください。

[Source URL](https://github.com/Azure/terraform-azurerm-network) をクリックします。

以前のチャレンジで行ったように、「Fork」ボタンでこのリポジトリの自分自身のフォークを作成します。

リポジトリをフォークする際、`Copy the master branch only` のチェックボックスを外しておきます。

**チェックボックスを外しておかないと、次のステップで行うモジュールの Publish が失敗します。**

このとき、`terraform-azurerm-network` モジュールをフォークします。

このページにある `terraform-azurerm-vnet` モジュールを **フォークしないように** 注意してください。

Step 2: Publish module in Terraform Cloud
=============================

Terraform Cloud の UI のトップページで、左側のメニューにある「Registry」をクリックします。

次に、「Publish」ボタンをクリックし、その下に表示される「Module」ボタンをクリックします。

「GitHub」ボタンをクリックし、先ほどフォークした `terraform-azurerm-network` リポジトリを選択します。

「Publish module」ボタンをクリックします。

モジュールの公開が完了したら、画面左上の **Version** の下の `Change` をクリックして、モジュールのバージョン `3.5.0` を選択してください。

もし `3.5.0` が表示されていない場合は、バージョンの公開に時間がかかることがありますので、一度ページを更新してください。

Step 3: Create terraform configuration file
=============================

モジュールの「Inputs」タブをクリックします。

これは、モジュールのインスタンスを作成する際に、モジュール変数 `resource_group_name` を指定しなければならないことを示しています。

`main.tf` ファイルですでに作成されているリソースを参照する入力の場合、それらのリソースの適切な属性を参照するようにすることをお勧めします。しかし、必要に応じて、ハードコードされた値を使用することもできます。

`hashicat-azure` ディレクトリに `network.tf` という新しい Terraform configuration ファイルを作成し、このファイルでモジュールを使用して Gaurav のための新しい Virtual Network を作成します。

「Shell」タブで以下を実行します。

```bash
touch network.tf
```

次に、Private Module Registry のモジュールのページの "Usage Instructions" セクションにある "Copy configuration details" に書かれているモジュール作成コードをコピーして、必要な `resource_group_name` モジュール変数を追加します。

Step 4: Write terraform code
=============================

「Code Editor」タブを開き、`network.tf` ファイルを以下の様に作成します。

`YOURNAME-training` は各自の Organization 名に合わせて修正する必要があります。

**ファイルを修正したら、必ず保存してください。** ファイルの右隣にあるフロッピーディスクのアイコン 💾 をクリックして、ファイルを保存します。

```hcl
module "network" {
  source  = "app.terraform.io/YOURNAME-training/network/azurerm"
  version = "3.5.0"
  # insert required variables here
  resource_group_name = "${var.prefix}-workshop"
}
```

Step 5: Git commit and push
=============================

「Shell」タブに移動し、最新の変更をリモートフォークに追加してコミットし、プッシュすることができます。

変更をプッシュするために、Github アカウントにログインするよう促されます（GitHub のユーザー名と個人用アクセストークン）。

```bash
git add .
git commit -m "Added network module"
git push origin master
```

すべてがうまくいっていれば、Terraform Cloud UI から新しい仮想ネットワークが構築されているのが確認できるはずです。

---

Terraform Cloud 上の `terraform apply` コマンドが完了するまで待ち、**Check** ボタンをクリックして動作を確認してください。