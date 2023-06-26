---
slug: private-module-registry
id: phyuz5qb8ab1
type: challenge
title: "\U0001F4DA Private Module Registry"
teaser: |
  ユーザーの中には、S3 バケットをデプロイする簡単な方法を求めている人もいるでしょう。[プライベート・モジュール・レジストリ](https://www.terraform.io/cloud-docs/registry)は、標準的で再利用可能な Terraform コードを保存し、他のユーザーが自分のワークスペースで使用できるようにします。
notes:
- type: text
  contents: "DevOps チームのほとんどが Terraform を使ってインフラを構築・設定しています。最近では、チーム外のユーザーから、自分のワークスペースの構築を手伝ってほしいという要望が寄せられています。データベース管理者である
    Gaurav は、昼食時にあなたを見かけ、助けを求めてきました。\n>\U0001F473\U0001F3FE‍♂️ こんにちは、上級システム管理者の方、S3
    バケットをいくつか設定する必要があるのですが、そのための Terraform モジュールがあると聞きました。hashicat-aws のワークスペースに新しい
    S3 バケットをセットアップするのを手伝ってもらえますか？"
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
このチャレンジでは、Terraform コードの再利用可能なモジュールを保存してバージョン管理できる、プライベートモジュールレジストリの使い方を学びます。

このモジュールをゼロから書く代わりに、パブリック Terraform レジストリから既存の AWS `s3-bucket` モジュールをコピーすることができます。この [URL](https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws) にアクセスして、`s3-bucket` モジュールをご覧ください。

Step 1: Fork repository
=============================

[このモジュール](https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws) の GitHub リポジトリを指す「Source Code」のリンクに注目してください。

[ソース URL](https://github.com/terraform-aws-modules/terraform-aws-s3-bucket) をクリックします。

前回のチャレンジで行ったように、「Fork」ボタンでこのリポジトリの独自のフォークを作成します。

Step 2: Publish module in Terraform Cloud
=============================

Terraform Cloud UI で、「Registry」をクリックします。

画面右上ら辺にある「Publish」ボタンをクリックし、「Module」をクリックします。

「GitHub」ボタンをクリックし、先ほど Fork した `terraform-aws-s3-bucket` リポジトリを選択します。

「Publish module」ボタンをクリックします。

モジュールの公開が完了したら、画面左上の **Version** の下の **Change** をクリックして、モジュールのバージョン `2.2.0` を選択してください。

`2.2.0` が表示されていない場合は、バージョンの公開に時間がかかることがありますので、一度ページを更新してください。

Step 3: Create terraform configuration file
=============================

次に、hashicat-aws ディレクトリに `s3-bucket.tf` という新しい Terraform ファイルを作成し、このファイルのモジュールを使って Gaurav さん用の新しい S3 バケットを作成します。

モジュール作成コードは、Private Module Registry にあるモジュールのページの「Usage Instructions」セクションからコピーすることができます。

モジュールの「Inputs」タブをクリックしてみて下さい。

これは、いくつかのモジュール変数（入力）を指定しなければならないことを示していますが、それらはすべてオプションとしてマークされています。

モジュール変数（入力）の `bucket_prefix` には、`prefix` 変数の値を設定することをお勧めします。これにより、AWS プロバイダはあなたの `prefix` で始まるバケット名を生成します。

まず、「Shell」タブで以下を実行します。

```bash
touch s3-bucket.tf
```

次に、Private Module Registry のモジュールのページの "Usage Instructions" セクションにある "Copy configuration details" に書かれているモジュール作成コードをコピーします。

Step 4: Write terraform code
=============================

「Code Editor」タブを開き、`s3-bucket.tf` ファイルを以下の様に作成します。

```hcl
module "s3-bucket" {
  source  = "app.terraform.io/YOURNAME-training/s3-bucket/aws"
  version = "2.2.0"
  bucket_prefix = "PREFIX"
}
```

`YOURNAME-training` は各自の Organization 名に合わせて修正する必要があります。

`PREFIX` に関しても同様に、各自設定した `prefix` 変数 (`terraform.tfvars` で確認する事が出来ます。または、Terraform Cloud のワークスペース `hashicat-aws` の Variables からも確認する事が出来ます。) で定義した値に合わせて修正します。

**ファイルを修正したら、必ず保存してください。** ファイルの右隣にあるフロッピーディスクのアイコン 💾 をクリックして、ファイルを保存します。

Step 5: Git commit and push
=============================

「Shell」タブに移動し、最新の変更をリモートフォークに追加してコミットし、プッシュすることができます。

`s3-bucket.tf` ファイルが保存されている事を確認したら、最新の変更をリモートフォークに追加、コミット、プッシュします。

変更をプッシュする際には、GitHub アカウントへのログインが求められます（GitHub のユーザー名と個人用アクセストークン）。

```bash
git add .
git commit -m "Added s3 bucket module"
git push origin master
```

すべてがうまくいくと、新しい S3 バケットが構築されているのが Terraform Cloud のワークスペース `hashicat-aws` の Runs の結果に表示されます。

---

`terraform apply` コマンドが完了するまで待ってから、**Check** ボタンをクリックして動作を確認してください。