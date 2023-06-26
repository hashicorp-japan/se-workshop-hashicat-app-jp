---
slug: terraform-code
id: muonmjnysenp
type: challenge
title: "\U0001F468‍\U0001F4BB Terraformコードでどんなの？"
teaser: Terraform DSL (Domain Specific Language) は宣言型言語です。ほぼすべてのタイプのインフラストラクチャの望むべき姿を記述できます。
notes:
- type: text
  contents: |-
    Terraformはカレントディレクトリ内の `*.tf` または `*.tfvars` で終わるものは何でも読み込みます。

    ほとんどのTerraformワークスペースには、`main.tf`, `variables.tf`, `outputs.tf`ファイルが含まれています。

    また、Terraformのコードを目的別にグループ化することもできます。例えば、すべてのロードバランサー設定コードを `load_balancer.tf` にまとめてリファクタリングできます。
tabs:
- title: Code Editor
  type: service
  hostname: workstation
  port: 8443
- title: Text Editor
  type: code
  hostname: workstation
  path: /root/hashicat-azure
- title: Shell
  type: terminal
  hostname: workstation
difficulty: basic
timelimit: 1000
---
ワークステーションに Terraformコードはすでに配置してあります。次のコマンドを実行してTerraformのコードファイルを確認してください。
 ```
 ls *.tf
 ```
 左側のファイルエクスプローラペインには、同じファイルが表示されます。Terraformファイルには紫色のTアイコンが付いています。

 Terraform のコードは常に `.tf` という拡張子で終わります。Terraform ファイルはいくつでも作成できますが、一般的には以下の 3 つのファイルが最初に作成されます。

 **main.tf** - 構築するリソースの定義を記述します。 <br><br>
 **variable.tf** - ユーザーが利用できる変数を記述します。 <br><br>
 **outputs.tf** - Terraformの実行が成功したときに表示される出力を記述します。<br><br>

 ファイルの末尾が `*.tf` または `*.tfvars` 以外のものは、Terraform によって無視されます。