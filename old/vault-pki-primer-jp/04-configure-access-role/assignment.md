---
slug: configure-access-role
id: mufpfmz36adu
type: challenge
title: Configure access role
teaser: 中間 CA にアクセスするための AppRole を作成します。
notes:
- type: text
  contents: '![Create an Application Method Role](../assets/app_role.png)'
tabs:
- title: Explainer
  type: service
  hostname: shell
  path: /seven
  port: 5000
- title: Vault UI
  type: service
  hostname: shell
  port: 8200
- title: Terminal
  type: terminal
  hostname: shell
difficulty: basic
timelimit: 180
---

AppRole の設定
=====================

中間 CA とやり取りするために、Vault の認証メソッドである AppRole を構成します。

Step by step
============

Vault を操作するために、`Terminal` タブを使用します。

1- パス `pki-broker-role` で AppRole 認証メソッドを有効にします。
```bash
vault auth enable -path pki-broker-role approle
```

AppRole 認証メソッドがパス `pki-broker-role` で有効化された事を確認します。
```bash
vault auth list
```

2- Vault ポリシー `pki-broker-policy` を作成します。

これにより、先ほど構成した中間 CA に対する権限が割り当てられます。証明書を発行するためには、最低限必要なのは `create` capability ですが、シークレットパスにアクセスするためには、`read` capability も必要になります。

```bash
vault policy write pki-broker-policy -<<EOF
path "hashicat-ca-intermediate/*" {
  capabilities = [ "create", "read", "update", "delete", "list", "sudo" ]
}
EOF
```

3- Vault ポリシー `pki-broker-policy` と AppRole のロール `pki-broker-role` を関連付けます。
```bash
vault write auth/pki-broker-role/role/pki-broker-role \
  token_policies=pki-broker-policy \
  secret_id_num_uses=0 \
  token_num_uses=0
```

Interactive mode
================

Step by Step に実行するのでは無く、下記スクリプトを実行し、設定する方法もあります。

```bash
04_setup_broker.bash
```

Express mode
============

インタラクティブなプロンプトなしで構築する場合、以下を実行します。

```bash
echo | 04_setup_broker.bash -d 2> /dev/null
```

