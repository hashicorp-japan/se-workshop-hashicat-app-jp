---
slug: sharing-is-caring
id: 8bmwf3xhx0dl
type: challenge
title: "\U0001F91D\U0001F3FC Working with Teams in Terraform Cloud"
teaser: |
  Terraform の利用が増えてくると、コラボレーションしたいチームメンバーが増えてきます。チームを追加して、組織のためのアクセスルールを設定しましょう。
notes:
- type: text
  contents: "数ヶ月が経過し、あなたは Terraform Cloud でより多くのインフラを構築し続けています。開発チームは Terraform を使いこなしていますが、Terraform
    Cloud の Organization にアクセスできないメンバーもいます。マネージャーの Hiro がクリップボードを持って、あなたのキュービクルに入ってきました。\n\n>\U0001F468\U0001F3FB‍\U0001F4BC
    この Terraform プロジェクトでの作業、お疲れ様でした。あなたのワークスペースへの Read アクセスが欲しいのですが、Lars と Aisha のセットアップも必要です。私たちの
    Organization にいくつかのチームを作成して、同僚をそこに追加していただけますか？"
- type: text
  contents: チームやロールベースのアクセスコントロールは、Terraform Cloud 有償版の機能です。このチャレンジをクリアするためには、インストラクターが
    Orgatnization を無料トライアルにアップグレードする必要があります。
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
チームやロールベースのアクセスコントロールは、Terraform Cloud 有償版の機能です。

このチャレンジを完了するには、Terraform Cloud の無料トライアルが有効になっていることを確認する必要があります。

このチャレンジでは、ワークスペースへのさまざまなレベルのアクセス権を持つチームを作成します。そして、他のユーザーを招待して、コードの変更、承認、Terraform の実行を共同で行うことができます。

このチャレンジは、全て Terraform Cloud 上で行なって行きます。

Step 1: Create team
=============================

Organization の **Settings** > **General Settings** にある **Teams** のリンクをクリックします。

以下 3 つのチームを追加します。

  1. **admins**
  1. **developers**
  1. **managers**

- **admins** というチームを追加します。

  アドミン(管理者) に付与する Organization Access は以下の 4 つを選択します。

    1. Manage Policies
    1. Manage Policy Overrides
    1. Manage Workspaces
    1. Manage VCS Settings

  4 つのチェックボックスにチェックを入れた後、必ず「Update team organization access」ボタンをクリックしてください。

- **developers** というチームを追加します。

  デベロッパー(開発者)は Organization 全体のアクセス権を持たないようにします。

  チェックボックスには何もチェックを入れず、「Update team organization access」ボタンをクリックしてください。

- **managers** という 3 つ目のチームを追加します。

  こちらもチームも Organization 全体のアクセス権を持たないようにします。

  チェックボックスには何もチェックを入れず、「Update team organization access」ボタンをクリックしてください。

Step 2: Assign role to team
=============================

次に、`hashicat-aws` ワークスペースにアクセス権を割り当てます。

`hashicat-aws` ワークスペースの **Settings** > **Team Access** へ移動します。

**Note:** Team Access のリンクが表示されない場合は、ログアウトして Terraform Cloud に入り直す必要があるかもしれません。

「Add teams and permissions」ボタンをクリックし、ワークスペースのアクセスを許可したい各チームの横にある「Select team」ボタンをクリックします。

その後、必要なパーミッションの **Assign permissions** ボタンをクリックします。

- **admins** グループに Admin レベルのアクセス権を付与します。

- **developers** グループに Write レベルのアクセス権を付与します。

- **managers** グループに Read レベルのアクセス権を付与します。

Step 3: Invite users to team
=============================

チームを作成し、ワークスペースへのアクセス権を与えたので、ユーザーを Organization に招待することができます。

Organization の **General Settings** に戻り、**Users** を選択します。

次に、**Invite a user** ボタンをクリックします。

インストラクターによるトレーニングを行っている場合は、インストラクターや仲間を Organization に招待し、開発者チームに配置することができます。

招待するには、Terraform Cloud のアカウントに登録されているメールアドレスが必要です。

このハンズオンでは、下記のサンプルユーザーを使用することができます。

- `workshops+aisha@hashicorp.com`
- `whorkshops+lars@hashicorp.com`
- `workshops+hiro@hashicorp.com`

ユーザーが招待を受け入れるまで、Organization 内のユーザーは表示されませんのでご注意ください。

このチャレンジにパスするためには、Organization 内に少なくとも 2 人のユーザー（自分を含む）が必要となります。招待したユーザーは、招待を受けなくてもカウントされます。