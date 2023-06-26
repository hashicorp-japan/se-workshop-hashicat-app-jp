---
slug: versioned-infrastructure
id: dkrf4embbboj
type: challenge
title: "\U0001F4BB Version Controlled Infrastructure"
teaser: |
  チームが大きくなり、コードレビューを実施する必要があります。Terraform Cloud は、一般的なバージョンコントロールシステムに接続し、コラボレーションとテストを可能にします
notes:
- type: text
  contents: "Terraform の利用が組織全体で増え続けているため、あなたのチームは全員の Terraform コードを保存・管理するより良い方法を必要としています。これまで、インフラの変更に伴うテストやコードレビューはあまり行われていませんでした。QA
    リードの Jane から連絡がありました。\n\n>\U0001F469‍\U0001F3A4 こんにちは、システム管理者の方、私たちはインフラのデプロイメントプロセスに、より良い品質保証を導入しようとしています。コードレビューを実施するために、hashicat-azure
    の GitHub リポジトリをワークスペースに追加するのを手伝ってくれませんか？"
- type: text
  contents: |-
    VCS リポジトリを Terraform Cloud のワークスペースに接続すると、Terraform を実行する前に、コードへの **すべての** 変更が VCS に保存される必要があります。これにより、コードで記述したインフラに、未承認の変更がないことが保証されます。

    さらに、コードレビュー、プルリクエスト、コードの自動テストなどの機能を有効にすることができます。
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
異なるチームや個人が同じ Terraform コードで作業できるようにするためには、バージョン管理システム (VCS) を使用する必要があります。Terraform Cloud は、GitHub, GitLab, Bitbucket を含む最も一般的な [VCS システムと統合](https://www.terraform.io/cloud-docs/vcs)する事ができます。

このチャレンジには、無料の GitHub.com アカウントが必要です。**仕事用のアカウントではなく、トレーニング用の個人アカウントを使用することをお勧めします（お持ちの場合）。**

Step 1: Fork repository
=============================

このチャレンジでは、最初のタスクとして `hashicat-azure` リポジトリのフォークを作成します。

以下の URL にアクセスし、右上の **Fork** ボタンをクリックして、リポジトリの独自のコピーを作成してください。

https://github.com/hashicorp/hashicat-azure

**Note:**
過去にこのトラックを実行した際に、すでにリポジトリをフォークしていた場合は、フォークを削除して再度フォークし、最新バージョンを使用しているか、また、このトラックで後にプッシュする変更がないかを確認してください。

リポジトリを削除するには、そのリポジトリの「Settings」メニューをクリックし、ページの一番下までスクロールし、「Danger Zone」セクションにある「Delete this repository」ボタンをクリックし、完全なリポジトリ名を入力し、「I understand the consequences, delete this repository」ボタンをクリックします。その後、上記のようにしてリポジトリを再フォークします。

Step 2: Update git configuration
=============================

「Shell」タブで以下のコマンドを実行して、自分のリポジトリの git 設定を更新します。

2 番目のコマンドの `YOURGITUSER` を自分の git ユーザー名に置き換えることを忘れないでください。

```bash
git remote remove origin
git remote add origin https://github.com/YOURGITUSER/hashicat-azure
```

もし 2 番目のコマンドを手順からコピーした後に 2 行に分かれてしまい、編集できない場合は、ブラウザのウィンドウを広くするか、右側の手順を一時的に隠して 1 行に収まるようにしてみましょう。

また、以下のコマンドを実行してください。

```bash
git pull
git branch --set-upstream-to=origin/master master
git config --global core.editor "vi"
```

次に、これらのコマンドを使って、メールアドレスと名前を設定します。

```bash
git config --global user.email "you@example.com"
```

```bash
git config --global user.name "Your Name"
```

Step 3: Push terraform configuration
=============================

`git` での作業を終えるために、「Shell」 タブで以下のコマンドを実行します。

変更した `remote_backend.tf` ファイルをコミットしてプッシュします.

```bash
git add .
git commit -m "Added remote backend"
git push origin master
```

`git push` コマンドを実行するには、GitHub のユーザー名と個人用アクセストークンを入力しなければならないことに注意しましょう。

**Note:** ここで使用した GitHub のユーザー名と個人用アクセストークンは後続のチャレンジでも使用します。

もし二要素認証を有効にしていて個人用アクセストークンを覚えていない場合は、次の手順を実施し、新しいアクセストークンを作成する必要があります。

Step 4: Configure GitHub setting
=============================

そのためには、GitHub にログインして Tokens ページを開きます。

https://github.com/settings/tokens

そして **Personal Access Tokens** をクリックし、ワークショップ用の新しいトークンを作成します。

トークン作成時の **Select scopes** 設定では、**repo** のみにチェックをし、トークンを生成します。生成したトークンは、後で削除してもかまいません。

このトークンを使って、自分のワークステーションから変更をプッシュすることができます。

これで `YOURGITUSER/hashicat-azure` リポジトリの自分のコピーができたので、次のステップにある TFC ドキュメントの **Configuring GitHub Access** のセクションに従って、GitHub アカウントを Terraform Cloud の Organization に接続します。

Step 5: Connecting GitHub to Terraform Cloud
=============================

[Configuring GitHub.com Access (OAuth)](https://www.terraform.io/docs/cloud/vcs/github.html)

1 つのワークスペース用の GitHub アプリではなく、Organization 用の OAuth 接続を設定することを確認してください。

Organization 用の GitHub アクセスを設定したら、ワークスペース `hashicat-azure` を更新して、すべての Terraform の実行のソースとして `YOURGITUSER/hashicat-azure` リポジトリを使用できるようにします。

Step 6: Configure workspace setting
=============================

ワークスペース `hashicat-azure` の **Settings** > **Version Control** に移動します。

ワークスペースを GitHub 上のあなたの `YOURGITUSER/hashicat-azure` リポジトリのフォークに接続します。

「Connect to version control」ボタンをクリックします。

次のメニューで「Version control workflow」を選択します。

次に、先程設定した version control provider を選択し、`YOURGITUSER/hashicat-azure` というレポジトリを選択します。

最後に、**Pull Requests** 設定の中にある **Automatic speculative plans** 機能を有効になっている事を確認します。

有効化したら、画面下部にある「Update VCS settings」ボタンをクリックします。

Step 7: Confirm new Terraform Run
=============================

VCS にバックアップされた最初の Apply がすぐに起動するはずです。

ワークスペースの「Runs」タブをクリックして、動作中の Terraform Run を表示します。

おめでとうございます！ Terraform のすべての変更は、ワークスペースで使用される前にバージョンコントロールシステムを通過する必要があります。

これにより、変更が本番環境にプッシュされる前にコードレビューを行うことができます。また、インフラを構築したコードに加えられたすべての変更の貴重な記録となります。これにより、コンフィギュレーションのドリフトやコード化されていない変更を防ぐことができます。

---

**Check** ボタンをクリックして、Jane に QA テスト用に `hashicat-azure` リポジトリをクローンできることを知らせましょう。