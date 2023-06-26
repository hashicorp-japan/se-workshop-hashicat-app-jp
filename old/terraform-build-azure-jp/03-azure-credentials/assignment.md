---
slug: azure-credentials
id: sgfypmjpp3da
type: challenge
title: "\U0001F510 TerraformでAzure cloudへ接続してみる"
teaser: Azureのサービスプリンシプルを用いてAzure APIに接続してみます。
notes:
- type: text
  contents: |-
    Microsoft社による、Azureのクレデンシャルを設定するためのわかりやすいチュートリアルもありますので参考にしてください。
    https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure
- type: text
  contents: |-
    Azure Cloud Shellは、Terraformを簡単に使い始めるためのもう一つの方法です。Azure Cloud Shellでは、Terraformはプリインストールされており、すぐに利用できるようになっています。
    https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-install-configure#use-azure-cloud-shell
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
Azureに接続してリソースを構築するためにクレデンシャルが必要です。

このInstruqtワークショップ環境には、必要なクレデンシャルがプリセットされています。これらのクレデンシャルは環境変数として保存されています。<br>
機密性の高いAPIキーをソースコードに直接記述するのは危険です。

Terraformはシェル環境にある環境変数を自動的に読み込んで使用します。

以下のコマンドを実行して、クレデンシャルを確認します。
```
env | grep ARM_CLIENT
```