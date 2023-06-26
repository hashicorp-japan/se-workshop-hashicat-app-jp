---
slug: traditional-application-deployment
id: d83y32anojac
type: challenge
title: Traditional Application Deployment
teaser: |
  従来の手法でクラウドにアプリケーションをテストして展開し、その効果を確認してみましょう。
notes:
- type: text
  contents: |-
    ITIL プラクティス... ITSM ツール... たくさんのサービス、リクエスト、そして書類の提出。

    各チームは独自のOLA とSLA を持っています...あなたはFIFO チケットキューにあるリクエストに過ぎません。
- type: text
  contents: |-
    **デモを開始する前にこのステップを実行してください！**

    以下のスクリプトを実行すると、このInstruqt トラックのTFC のOrganization とAPI トークンが提供されます。
    ```
    ~/setup/scripts/tfc-setup.sh
    ```

    なお、トークンを貼り付けると表示されなくなるので、2回貼り付けないようにしてください。
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
timelimit: 900
---
あなたは、HashiCorp の新しい取り組みをリードする新しい開発者です。 HashiCups Coffee-as-a-Service へようこそ!

あなたはAWS が推奨する標準的なインフラストラクチャのアーキテクチャに従っています。パブリック/プライベートサブネット、NAT ゲートウェイ、複数AZ構成、など。

また、アプリケーションのデプロイに時間がかかり、多くのチーム間で依存関係やボトルネックが存在しています。

従来は、ネットワークチーム、サーバーチーム、データベースチーム、セキュリティチーム...とチケットを発行し、最後に開発チームにチケットを発行して、前のチケットで準備されたインフラにアプリケーションをデプロイしていました。

これらは、あなたが依存関係を持つ可能性のあるチームのほんの一部です。

このようなやり方は、かなり最近まで標準的なものでした。しかし、私たちは今、手作業によるチケットベースから、敏捷性とセルフサービスのプロセスへと改善する必要が出てきています。

ここでは、従来のアプローチの欠点と、それを解決するいくつかの方法を探ってみましょう。

多くのチームにまたがってチケットをオープンする事が出来ます:
  * コアとなるネットワーク接続 - ネットワークチームへのチケット
  * ベースとなるサーバー - サーバーサポートへのチケット
  * データベースサーバー - DBA へのチケット
  * ファイアウォールのアップデート - セキュリティチームへのチケット
  * 待ち時間
  * チーム間のコミュニケーションが不明確で、フォローアップが必要な場合が多い