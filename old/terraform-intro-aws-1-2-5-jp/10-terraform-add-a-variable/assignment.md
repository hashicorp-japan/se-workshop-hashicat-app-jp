---
slug: terraform-add-a-variable
id: cq4lb2sea8ic
type: challenge
title: "\U0001F5FC Change Your Location"
teaser: |
  Terraform は世界中のどこにでもインフラをデプロイできるほど柔軟です。たった一つの変数を変えるだけで、簡単にアプリケーションを異なるリージョンにプロビジョニングすることができます。
notes:
- type: text
  contents: |-
    `variables.tf` ファイルで定義された変数は、個人の `terraform.tfvars` に設定することで上書きすることができます。

    この課題では、AWS リソースを配置するリージョンを選択します。
tabs:
- title: Shell
  type: terminal
  hostname: workstation
- title: Code Editor
  type: code
  hostname: workstation
  path: /root/hashicat-aws
difficulty: basic
timelimit: 1000
---
前回のチャレンジでは、`terraform.tfvars` ファイルに `prefix` という変数を設定しました。ここでは、AWS インフラストラクチャが配置されるリージョンを決定する、別の変数を設定しましょう。

まず、`terraform plan` を実行して、リージョンを変更した後に何が起こるかを比較できるようにします。

```
terraform plan
```

デフォルトの `us-east-1` とは異なる、近くの AWS リージョンを選択します。`terraform.tfvars` ファイルに `region` 変数を追加し、`us-west-1`, `eu-west-2`, `ap-southeast-1` などの希望のリージョンを設定します。

AWS の有効なリージョンの一覧は以下のリンクを参照してください。

https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-available-regions

リージョンが近いと、速度やパフォーマンスが向上します。

**必ずファイルの上にあるディスクアイコンをクリックして、変更を保存してください！**。

変数 `region` を設定したら、もう一度 `terraform plan` を実行してみてください。今度は何が違うでしょうか？

`variables.tf` ファイルで宣言した変数は、`terraform.tfvars` ファイルで値を設定できることを覚えておいてください。