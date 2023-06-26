---
slug: tf-cloud-setup
id: jsfzzgiqzsno
type: challenge
title: Terraform Cloud Setup
teaser: |
  Terraform - now in SaaS-flavor!
notes:
- type: text
  contents: |-
    さて、Terraform のステートをネットワークチーム用のワークスペースに移行していきます。ORG を作成し、ユーザーを招待し、ロールベースのアクセス制御(RBAC)をセットアップします。

    これらは、プロビジョニングワークフローを自動化されたプロデューサー/コンシューマーモデルに変換するための最初のステップになります。
tabs:
- title: Terminal
  type: terminal
  hostname: terraform
- title: Code Editor
  type: service
  hostname: terraform
  port: 8443
- title: Terraform Cloud
  type: external
  url: https://app.terraform.io
- title: Slides
  type: website
  url: https://hashicorp.github.io/field-demos-terraform-land-team-Apollo-11/#1
difficulty: basic
timelimit: 1800
---
**重要**: このチャレンジでは、2つの選択肢があります:
  1. 既存のステートファイルをどのように移行するかをデモすることができます。前の課題のプロジェクトを使用することができます。
  2. Terraform Cloud を直ぐに使うことも出来ます。HashiCups アプリケーション用に3つの環境ワークスペースが用意されます。

**Steps to Migrate Existing State**
これから、オープンソースで実装したTerraform をTerraform Cloud に移行する手順を説明します。

Terraform Cloudのプライベートインストール(Self-managed なTerraform Enterprise)は、クラウドやオンプレミスのデータセンターで実行することができます。しかし、このデモで扱うのはこれではありません。

まずは、Terraform Cloud のアカウントを使って始めたいと思います。このデモでは、設定済みのアカウントを使用しますが、Terraform Cloud のアカウントはここから簡単に作成する事が出来ます (https://app.terraform.io/signup/account)。

Terraform Cloud では、Organizations と Workspaces (アプリケーション/環境) を中心にすべてが構成されています。

このデモでは、`hashicups-cli` という名前のワークスペースを使用することにします。`terraform apply` で作成した `.tfstate` ファイルをこの新しいワークスペースに移行します。

**注:** 一元管理されたステートファイルは多くの利点があります（バージョン管理、簡単な管理、アクセス制御、同時アクセスの問題がない、など）。

「Code Editor」タブで, `remote-backend.tf` ファイルに適切な変数が設定されている事を確認します。(これはすでに設定されているはずです)

次に、「Terminal」タブに戻り、以下のコマンドを実行します:

```
cd /root/gitclones/hashicups-application
terraform init
```

Terraform Cloud のワークスペース`hashicups-cli` にステートを移行することの確認を求められるため、`yes` と入力します。

Terraform Cloud のワークスペース`hashicups-cli` の"State" メニューを選択すると、ステートファイルがTerraform Cloud にコピーされていることが確認できます。

この段階で、ローカルの `.tfstate` ファイルを安全に削除することができます。

これで完了です!

**GitLab Integration**
HashiCups アプリケーションのTerraform Cloud には、各環境（Dev、Staging、Prod）ごとに3つのワークスペースが用意されます。これを利用して、環境間の変更をマージして表示することができます。 また、TFC でWebhook の設定を表示することもできます。

「Terminal」タブに表示されたユーザー名とパスワードでGitLab のURL にログインし、`hashicups-development-team/hashicups-application` プロジェクトを表示します。 3つのブランチがあり、そのブランチ間でリクエストをマージすることができます。これはコラボレーションを促進するのに役立ちますが、すべてのモジュールは同じプロジェクトにあります。次はプライベートモジュールレジストリについて見ていきます。

GitLab からTerraform Cloud のHashiCups ワークスペースに変更をプッシュしようとする前に、まずTerraform Cloud UI でそれらのワークスペースに手動で実行をトリガーする必要があります。今すぐそれを行うことをお勧めします。`hashicups-dev` ワークスペースはプランを自動適用するように設定されていますが、`hashicups-staging` と`hashicups-prod` ワークスペースはそうなっていないことに注意しましょう。ステージング環境とプロダクション環境では、より注意したいものです。