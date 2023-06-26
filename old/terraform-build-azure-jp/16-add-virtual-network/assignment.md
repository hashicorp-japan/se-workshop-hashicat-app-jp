---
slug: add-virtual-network
id: 6r41xieqysg1
type: challenge
title: "\U0001F5A7 Virtual Networkを追加する"
teaser: Terraformのコードはブロックを積み上げていくように作っていくことができます。望むべき姿になるまで、もくもくとブロックを追加していきます。
notes:
- type: text
  contents: Terraformのコードはブロックを積み上げていくように作っていくことができます。望むべき姿になるまで、もくもくとブロックを追加していきます。
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
もう一度 **main.tf** ファイルを開き、ファイル内の次のリソースブロックのコメントを解除します。リソースのタイプは **azurerm_virtual_network** で、名前は **vnet** です。

各行の先頭から `#` 文字を削除して、コードのコメントを解除します。

**HINT:** 　コメントアウトしたいコードブロックを選択して、*Edit -> Toggle Line Comment*で一斉にコメント解除ができます。

この修正で新しいProviderが必要になるので、再度 `terraform init` を実行します。
そして、`terraform apply`を実行して、結果をみてください。

main.tfのazurerm_virtual_networkリソースの**location**と**resource_group_name**パラメータを見てください。これらへは別のリソースからの値や変数がセットされており、これによりTerraformはリソース間の依存関係を構築します。

Terraform は、何百もの相互接続されたリソース間の複雑な依存関係をマッピングすることができます。