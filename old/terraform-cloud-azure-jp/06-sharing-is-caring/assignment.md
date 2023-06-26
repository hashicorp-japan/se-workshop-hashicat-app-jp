---
slug: sharing-is-caring
id: oxjxraxae9hy
type: challenge
title: "\U0001F91D\U0001F3FC Terraform Cloudでチーム作業を行う。"
teaser: |
  Terraform の利用が増えると、コラボレーションしたいチームメンバーが増えてきます。組織のためにチームとアクセスルールを追加してみましょう。
notes:
- type: text
  contents: "数ヶ月が経過し、あなたはTerraform Cloud でより多くのインフラを構築し続けています。開発チームはTerraform を使いこなしていますが、Terraform
    Cloud の Organization  にアクセスできないメンバーもいます。マネージャーのHiro があなたに対してこう言いました。。\n\n>\U0001F468\U0001F3FB‍\U0001F4BC
    このTerraform プロジェクトのために尽力してくれてありがとう。あなたのワークスペースへのRead アクセスが欲しいのですが、Lars とAisha
    のセットアップも必要です。私たちのorganizaiton でいくつかのチームを作成して、あなたの同僚をそこに追加していただけますか？"
- type: text
  contents: チームやロールベースのアクセスコントロールは、Terraform Cloud の有償版で利用出来る機能になります。このチャレンジを利用するためには、インストラクターがお客様の
    Organization  を無料トライアルにアップグレードする必要があります。
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
チームやロールベースのアクセスコントロールは、Terraform Cloud の有償版で利用出来る機能です。このチャレンジを完了するには、前のステップで無料トライアルが有効になっていることを確認する必要があります。

このチャレンジでは、ワークスペースへのさまざまなレベルのアクセス権を持つチームを作成します。そして、他のユーザーを招待して、コードの変更、承認、Terraform の実行を共同で行うことができます。

1. ご自身の Organization の 「General Settings」 に入り、**Teams** リンクをクリックします。<br>
2. **admins** というチームを追加します。Admin は、ポリシーの上書き、管理、ワークスペースの管理、VCS 設定の管理が出来る事を想定しています。4つのチェックボックスにチェックを入れた後、必ず「Update　team　Organization　access」ボタンをクリックしてください。<br>
3. **developers** というチームを追加します。開発者は Organization　全体のアクセス権を持たないようにします。<br>
4. **managers** という名前の3つ目のチームを追加します。マネージャーも Organization　全体のアクセス権を持たないようにします。

次に、hashicat-azure ワークスペースにアクセス権を割り当てます。hashicat-azure ワークスペースの設定の **Team Access** ページに入ります。Team Access のリンクが表示されない場合は、一度ログアウトしてTerraform Cloud に入り直す必要があるかもしれません。

"Add team and permissions" ボタンをクリックし、ワークスペースのアクセスを許可したい各チームの横にある "Select team" ボタンをクリックします。その後、必要なパーミッションの "Assign permissions" ボタンをクリックします。

* **admins** グループに　Admin レベルのアクセス権を付与します。<br>
* **developers** グループに　Write レベルのアクセス権を付与します。<br>
* **managers** グループに　Read レベルのアクセス権を与える。<br>

チームを作成し、ワークスペースへのアクセス権を与えた後、何人かのユーザーを Organization に招待することができます。Organization の**General Settings** に戻り、**Users** を選択します。次に "Invite a user" ボタンをクリックします。

インストラクターによるトレーニングを行っている場合は、インストラクターや仲間の学生を Organization に招待し、開発者チームに配置することができます。招待するには、Terraform Cloud のアカウントに登録されているメールアドレスが必要です。

また、下記のサンプルユーザーを使用することもできます。

* `workshops+aisha@hashicorp.com`
* `workshops+lars@hashicorp.com`
* `workshops+hiro@hashicorp.com`

ユーザーが招待を受け入れるまで、Organization 内のユーザーは表示されませんのでご注意ください。

このチャレンジをパスするためには、 Organization 内に少なくとも2人のユーザー（自分を含む）が必要となります。招待したユーザーは、招待を受けなくてもカウントされます。