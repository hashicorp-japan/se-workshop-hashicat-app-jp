---
slug: use-a-provisioner
id: egmag6yxyysn
type: challenge
title: "\U0001F6E0️ Use a Provisioner"
teaser: |
  Terraform は Chef、Puppet、Ansible、Bash、Powershell を含む様々なツールと相性が良いです。
notes:
- type: text
  contents: Terraform provisioner は作成時に一度だけ実行されます。特別な状況を除いて、その後の apply では実行されません。(このトレーニングラボのように...)
- type: text
  contents: コマンド `terraform apply` と入力するたびに provisioner が実行されるように特別な調整を行いました。これは、変更を加えるたびに仮想マシンを破壊して再作成することなく、provisioner
    で遊ぶ練習ができるようにするためです。
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
「Code Editor」タブで `main.tf` ファイルをペンでクリックします。下にスクロールして、`remote-exec` provisioner ブロックを見つけます。

インラインのコマンドリストの最後に、以下の2行を追加してください。

```
"sudo apt -y install cowsay",
"cowsay Mooooooooooo!",
```

バッファにコピーした後、`>` アイコンをクリックして右側の課題を隠すと、貼り付けが簡単になります。もう一度クリックすると、課題が再表示されます。**必ずファイルを保存してください。**

これは `terraform fmt` コマンドを使用して、コードをきれいに並べる良い機会かもしれません。

さて、変更を適用しましょう。

```
terraform apply -auto-approve
```

Terraform のログ出力をスクロールして戻ってください。アスキーアートの牛が "Moooooo!" と言っているのが見えるはずです。