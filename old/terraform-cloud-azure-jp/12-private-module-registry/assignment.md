---
slug: private-module-registry
id: rzbgchx8xifl
type: challenge
title: "\U0001F4DA Private Module Registry"
teaser: |
  ユーザーの中には、データベースやネットワークをデプロイする簡単な方法を求めている人もいるでしょう。プライベートモジュールレジストリは、標準的で再利用可能な Terraform コードを保存し、他のユーザーが自分のワークスペースで使用できるようにします。
notes:
- type: text
  contents: "devops チームのほとんどが Terraform を使ってインフラを構築・設定しています。最近では、チーム外のユーザーから、自分のワークスペースの構築を手伝ってほしいという要望が寄せられています。データベース管理者の
    Gaurav は、昼食時にあなたを見かけて助けを求めてきました:\n>\U0001F473\U0001F3FE‍♂️ Azure Virtual Networksを設定する必要がありますが、このための
    Terraform モジュールがあると聞きました。 hashicat-azure のワークスペースに新しいネットワークをセットアップするの手伝ってもらえませんか？"
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
difficulty: basic
timelimit: 1800
---
このチャレンジでは、Terraform コードの再利用可能なモジュールを保存してバージョン管理できる、プライベートモジュールレジストリの使い方を学びます。

このモジュールをゼロから書く代わりに、パブリック Terraform レジストリから既存の Azure network モジュールをコピーすることができます。この[URL](https://registry.terraform.io/modules/Azure/network/azurerm)にアクセスして、Azure network モジュールをご覧ください。

このモジュールの GitHub リポジトリを指す**Source Code**のリンクに注目してください。ソースURLをクリックします。前回のチャレンジで行ったように、「Fork」ボタンでこのリポジトリの独自のフォークを作成します。

Terraform Cloud UI に戻り、ページ上部の "Registry" タブをクリックします。"Publish"から"Module"をクリックします。"GitHub" ボタンをクリックし、先ほどフォークした terraform-azure-network リポジトリを選択します。

"Publish module"ボタンをクリックします。

モジュールの公開が完了したら、画面左上の **Version** の下にある **Change** をクリックして、モジュールのバージョン`3.0.1`を選択してください。
**新しいバージョンは、main.tfの`providers`ブロックに固定されたAzureプロバイダのバージョンでは動作しませんので、使用しないでください。**

モジュールの "Inputs "タブをクリックします。これは、モジュールのインスタンスを作成する際に、モジュール変数 `resource_group_name` を指定しなければならないことを示しています。main.tfファイルで作成されたリソースを参照する入力については、それらのリソースの適切な属性を参照する参照を使用することをお勧めします。しかし、必要に応じてハードコードされた値を使用することもできます。

hashicat-azure ディレクトリに `network.tf` という新しい Terraform ファイルを作成し、このファイルのモジュールを使って Gaurav 用の新しい Virtual Network を作成します。モジュール作成コードは、Private Module Registry のモジュールのページの "Provision Instructions" セクションからコピーできます。
Moduleのコードの中に、必須入力値である `resource_group_name`　を記述します。`resource_group_name`には値をハードコードしてもよいですし、Terraformで生成するリソースから引っ張ってきても構いません。

```
module "network" {
  source  = "app.terraform.io/masa-training/network/azurerm"
  version = "3.0.1"
  # insert required variables here
  resource_group_name = azurerm_resource_group.myresourcegroup.name
}
```

`network.tf` ファイルを保存したら、最新の変更をリモートフォークに追加、コミット、プッシュすることができます。変更をプッシュするために、github アカウントへのログインが促されます。

```
git add .
git commit -m "Added vnet module"
git push origin master
```

すべてがうまくいくと、新しい Network が構築されているのがコンソール出力に表示されます。`terraform apply` コマンドが完了するまで待ってから、**Check**ボタンをクリックして動作を確認してください。