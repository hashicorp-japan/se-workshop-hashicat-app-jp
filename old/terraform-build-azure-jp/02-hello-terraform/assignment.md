---
slug: hello-terraform
id: hhxunimzk5pt
type: challenge
title: "\U0001F44B Terraform最初の一歩"
teaser: もっとも基本的なコマンドから試していきましょう。
notes:
- type: text
  contents: |-
    Terraform OSSはダウンロードしてPathを通すだけ動作します。

    TerraformはGo言語で作成されており、ほとんどプラットフォーム上で動作します。最新のバージョンはこちらよりご確認ください。https://www.terraform.io/downloads.html

    細かいステップについては以下のLearnガイドを参照ください。

    https://learn.hashicorp.com/terraform/getting-started/install.html

    このInstruqtの環境ではTerraformは事前にインストールしてあります。
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
基本的なTerraformのコマンドをみていきましょう。
以下のコマンドをShellタブで実行してTerraformのバージョンを確認してください。

```
terraform version
```

Terraformのヘルプは以下のコマンドでみることができます。

```
terraform -help
```

この環境はTerraformがあらかじめインストールされており、設定もしてある状態になっています。