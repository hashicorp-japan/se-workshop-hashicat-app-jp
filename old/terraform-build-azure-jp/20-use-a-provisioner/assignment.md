---
slug: use-a-provisioner
id: n15vx9u05pr3
type: challenge
title: "\U0001F6E0️ Provisionerを使う"
teaser: TerraformはChef, Puppet, Ansible, Bash, Powershellなどの様々なプロビジョニングツールと連携できます。
notes:
- type: text
  contents: 通常、Terraform providionerは、そのリソース作成や変更時にだけ実行されます。
- type: text
  contents: Provisionerはそのリソースが再生成されないと実行されません。ただし、このワークショップでは`apply`の度にProvisionerが実行されるような仕組みにしてあります。
- type: text
  contents: |-
    ```
    ______________________
    < Cows love Terraform! >
     ----------------------
             \   ^__^
              \  (oo)\_______
                 (__)\       )\/\
                     ||----w |
                     ||     ||
    =============================
    ```
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
コードエディタで `main.tf` ファイルを開いてください。下にスクロールして `remote-exec` Provisionerブロックを見つけるか、ファイルを検索してCTRL-Fで見つけてください。。

インラインのコマンドリストの最後に以下の2行を追加します。

```
"sudo apt -y install cowsay",
"cowsay Mooooooooooo!",
```

ここで、`terraform apply -auto-approve` を実行して変更を適用します。

```
terraform apply -auto-approve
```

ログ出力をスクロールバックしてみましょう。アスキーアートの牛が "Moooooooooo!" と言っているのが見えるはずです。

Provisionerを使う事で、任意のスクリプトやコマンドを実行できます。

AnsibleなどのConfiguration managementツール（構成管理ツール）と組み合わせる事で、インフラだけでなくOSレイヤのProvisioningも一気に行うことが可能です。