---
slug: setup-our-environment
id: xprs8oumowzj
type: challenge
title: "\U0001F3E1 Moving in - Set Up Your Workspace"
teaser: コードエディターを Terraform 用に設定し、ワークスペースを開きます。
notes:
- type: text
  contents: "ACME Inc.での仕事の初日を迎えました。これはACMEのオフィスにいる同僚たちです。\n<center><table cellpadding=20>\n
    \ <tr>\n    <td>\n    \U0001F468\U0001F3FB‍\U0001F4BC Hiro - Product Manager<br>\n
    \   \U0001F9D5\U0001F3FD Aisha - Database Admin<br>\n    \U0001F46E\U0001F3FF‍♂️
    William - InfoSec Lead<br>\n    \U0001F468\U0001F3FB‍\U0001F9B2 Lars - Lead Developer<br>\n
    \   </td>\n    <td>\n    \U0001F9D3\U0001F3FB Robin - Operations Admin<br>\n    \U0001F469‍\U0001F3A4
    Jane - Quality Assurance<br>\n    \U0001F473\U0001F3FE‍♂️ Gaurav - Network Admin<br>\n
    \   \U0001F469\U0001F3FC‍\U0001F4BC Karen - Finance    </td>\n  </tr>\n</table></center>\n\n<center>\U0001F913
    You - Brand New Intern\n</center>"
- type: text
  contents: 最新のテキストエディタはTerraform のシンタックスハイライトに対応しています。
tabs:
- title: Code Editor
  type: service
  hostname: workstation
  port: 8443
- title: Text Editor
  type: code
  hostname: workstation
  path: /root/hashicat-aws
- title: Shell
  type: terminal
  hostname: workstation
difficulty: basic
timelimit: 1800
---
ACME Inc.のインターンとしての最初の日にようこそ。[ACME](https://www.youtube.com/watch?v=9m7evoFF83c)は、アンビル、ロケット式ローラースケート、ポータブルホール、地震の薬、鳥の餌などを販売する多国籍コングロマリット企業です。

社員オリエンテーションの後、あなたはワークステーションに座り、テキストエディターのVisual Studio Codeを開きます。

左側の「**Code Editor**」タブを開きます。これは、Visual Studio Code エディタを起動しているところです。お好みで、よりシンプルな「**Text Editor**」タブを使うこともできます。

VS コードエディタを使用する場合は、以下の手順を実行してください。

1. VS コードエディタの上部にある"File", "Edit"などのメニューバーに注目してください。このメニューバーには、すべてのメニューがあります。

2. 左側のメニューのエクスプローラーバーに、いくつかのファイルが表示されているはずです。これらは hashicat アプリケーション用の Terraform のconfiguration ファイルです。`main.tf` というファイルを開いてください。

3. 次に、コードのシンタックスハイライトを有効にするために、HashiCorp Terraform extension をインストールしてください。拡張機能のアイコンをクリックしてください。

4. **HashiCorp** を検索し、"HashiCorp Terraform 2.x.y" エクステンションを選択します。青い**Install**、または青い**Install in Remote**ボタンをクリックして、拡張機能をインストールします。必要であれば、"HashiCorp Sentinel" 拡張機能をインストールすることもできます。その後、ファイルメニューの下にある2ページのアイコンをクリックすると、Terraform のファイルが再び表示されます。

5. コードエディタの自動保存を有効にしているので、入力した変更はそのまま保存されます。手動でファイルを保存する必要はありません。

すべてのコマンドは「**Shell**」タブで実行する様にします。

おめでとうございます！これで Terraform on AWS を使い始める準備が整いました。新しい Terraform のスキルを学ぶために、残りのチャレンジではhashicat-aws のサンプルアプリを使用します。

続けるには **Check** ボタンをクリックしてください。