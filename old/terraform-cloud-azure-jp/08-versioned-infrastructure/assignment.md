---
slug: versioned-infrastructure
id: ykq2wyarq4sw
type: challenge
title: "\U0001F4BB インフラのバージョン管理"
teaser: |
  チームが大きくなり、コードレビューを実施する必要が出てきました。Terraform Cloud は、一般的なバージョン管理システムと連携し、コラボレーションとテストを可能にします。
notes:
- type: text
  contents: "組織全体でTerraform の利用が増え続ける中、チームは全員のTerraform コードを保存・整理するためのより良い方法を必要としています。これまで、インフラの変更に伴うテストやコードレビューはあまり行われていませんでした。QA
    lead の Jane からこう言われました。:\n\n>\U0001F469‍\U0001F3A4 コードレビューを実施するために、hashicat-azure
    の GitHub リポジトリをワークスペースに追加するのを手伝ってくれませんか？"
- type: text
  contents: |-
    VCS リポジトリを Terraform Cloud のワークスペースに接続すると、Terraform を実行する前に、コードへの**すべての**変更が VCS に保存されている必要があります。これにより、コードとしてのインフラストラクチャに未承認の変更がないことが保証されます。

    また、コードレビュー、プルリクエスト、コードの自動テストなどの機能を有効にすることができます。
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
異なるチームや個人が同じ Terraform コードで作業できるようにするためには、バージョンコントロールシステム（VCS）を使用する必要があります。Terraform Cloud は、GitHub、GitLab、Bitbucketを 含む最も一般的な VCS と連携する事ができます。

このチャレンジには、無料の GitHub.com アカウントが必要です。仕事用のアカウントではなく、トレーニング用の個人アカウントを使用することをお勧めします（お持ちの場合）。

このチャレンジでは、最初のタスクとして hashicat-azure リポジトリのフォークを作成します。この URL にアクセスし、右上の **Fork** ボタンをクリックして、リポジトリの独自のコピーを作成してください。

https://github.com/hashicorp/hashicat-azure

**注意：** 過去にこのトラックを実行した際に、すでにリポジトリをフォークしていた場合は、フォークを削除して再度フォークし、最新バージョンを使用しているか、また、このトラックで後にプッシュした変更がないかを確認してください。リポジトリを削除するには、そのリポジトリの「設定」メニューをクリックし、ページの一番下までスクロールし、「Danger Zone」セクションにある「Delete this repository」ボタンをクリックし、完全なリポジトリ名を入力し、「I understand the consequences, delete this repository」ボタンをクリックします。その後、上記のようにしてリポジトリを再フォークします。

以下のコマンドを実行して、自分のリポジトリのgit　設定を更新します。2番目のコマンドの `YOURGITUSER` をご自身の　git　ユーザー名に置き換えることを忘れないでください。

```
git remote remove origin
git remote add origin https://github.com/YOURGITUSER/hashicat-azure
```
もし2番目のコマンドが2行に分かれてしまい、編集できない場合は、ブラウザのウィンドウを広くするか、右側のノート部分を一時的に隠して1行に収まるようにしてみて下さい。

次に、以下のコマンドを実行してください。

```
git pull
git branch --set-upstream-to=origin/master master
git config --global core.editor "vi"
```

次に、これらのコマンドを使って、メールアドレスと名前を設定します。
```
git config --global user.email "you@example.com"
```

```
git config --global user.name "Your Name"
```

`git`での作業を終えるために、「Shell」タブで以下のコマンドを実行して、変更した `remote_backend.tf` ファイルをコミットしてプッシュします。

```
git add .
git commit -m "adding remote backend"
git push origin master
```

なお、`git push`コマンドを実行するためには、GitHubのユーザー名とパスワード、または個人用アクセストークンを入力する必要があります。

二要素認証を有効にしていてパーソナルアクセストークンを覚えていない場合は、新しいアクセストークンを作成する必要があります。そのためには、GitHub にログインして Tokens ページを開きます。

https://github.com/settings/tokens

そして **Personal Access Tokens** をクリックし、ワークショップ用の新しいトークンを作成します。生成するトークンにはRepoへのpublic_repo権限を付随してください。
生成したトークンは、後で削除してもかまいません。このトークンを使って、自分のワークステーションから変更をプッシュすることができます。

これで hashicat-azure リポジトリの自分のコピーができたので、TFC　ドキュメントの**Configuring GitHub Access**のセクションに従って、GitHub アカウントをTerraform  Organization に接続します。

https://www.terraform.io/docs/cloud/vcs/github.html

もしくは、以下のドキュメントを参照の上、GitHub と Terraform Cloud との連携を行ってください。

https://github.com/hashicorp-japan/terraform-workshop-jp/blob/master/contents/vcs.md

**注意：** Organization名やワークスペース名は今回のHnadsonを前提にしていたものになっていないため、Organzation名やワークスペース名は、本Handsonで設定しているものに読み替えた上で、参考にして下さい。

1つのワークスペース用の GitHub アプリではなく、 Organization 用の **OAuth** 接続を設定することを確認してください。

Organization 用の GitHub アクセスを設定したら、**hashicat-azure**ワークスペースを更新して、すべての Terraform 実行のソースとして hashicat-azure リポジトリを使用できるようにします。ワークスペースの **Settings > Version Control** 設定ページに入り、ワークスペースを GitHub 上のあなたの hashicat-azure リポジトリのフォークに接続します。

また、設定を保存する前に「Automatic Run Triggering」の「Automatic speculative plans」機能を有効にします。

VCS　連携されると、最初の`terraform apply` がすぐに起動するはずです。Terraform Cloud のワークスペースの「Runs」タブをクリックして、動作中の Run を表示します。

おめでとうございます！Terraform のすべての変更は、ワークスペースで使用される前にVCS　を通過する事になりました。これにより、変更が本番環境にプッシュされる前にコードレビューを行うことができます。また、インフラを構築したコードに加えられたすべての変更が貴重な記録となります。これにより、コンフィギュレーションのドリフトや文書化されていない変更を防ぐことができます。

**Check** ボタンをクリックして、次に進みます。