---
slug: define-trusted-entity-workflow
id: 9idmd0reu52s
type: challenge
title: Create Trusted Entity Workflow
teaser: 信頼されたエンティティのワークフローをシミュレートします。
notes:
- type: text
  contents: '![Create Trusted Entity Workflow](../assets/trusted_workflow.png)'
tabs:
- title: Explainer
  type: service
  hostname: shell
  path: /eight
  port: 5000
- title: Vault UI
  type: service
  hostname: shell
  port: 8200
- title: Terminal
  type: terminal
  hostname: shell
difficulty: basic
timelimit: 300
---

AppRole 認証メソッドを用いたトークン取得のワークフロー構築
==============================

アプリを認証するための認証メソッドである AppRole を用いて、Vault を利用するために必要なトークンを取得するためのワークフローをシミュレートしていきます。

Step by step
============

Vault を操作するために、`Terminal` タブを使用します。

1- ロール `pki-broker-role` の RoleID を取得します。
```bash
export ROLE_ID=$(vault read -format=json \
  auth/pki-broker-role/role/pki-broker-role/role-id \
  | jq -r '.data.role_id')
```

2- ロール `pki-broker-role` の SecretID を取得するためのレスポンスラッピングトークンを取得します。
```bash
export WRAPPED_TOKEN=$(vault write -format=json \
  -wrap-ttl=300s -force \
  auth/pki-broker-role/role/pki-broker-role/secret-id \
  | jq -r '.wrap_info.token')
```

3- ラッピングトークンを、JSON フォーマットで環境変数 `SECRET_STORE_WRAPPED_TOKEN` に設定します。

これは、SecretID をラップしているトークンをブローカーのスコープ内のシークレットストアに格納することをシミュレートしています。ラップトークンの使用は300秒に制限しています。

```bash
cat <<EOF > ${SECRET_STORE_WRAPPED_TOKEN}
{
  "token" : "${WRAPPED_TOKEN}"
}
EOF
```

4.1- ラップトークンを環境変数 `WRAPPED_TOKEN` に設定します。

```bash
export WRAPPED_TOKEN=$(cat ${SECRET_STORE_WRAPPED_TOKEN} \
  | jq -r '.token')
```

4.2- ラップトークンを用いて、SecretID を取得します。

```bash
export SECRET_ID=$(VAULT_TOKEN=${WRAPPED_TOKEN} \
  vault unwrap -format=json \
  | jq -r '.data.secret_id')
```

5- SecretID と RoleID を信頼されるエンティティに格納します。

これは、ブローカーのスコープ内のシークレットストアに AppRole の RoleID と SecretID を格納することをシミュレートしています。これらは Vault でシークレットを利用するためのアクセス認証情報であり、公開されるべきものではありません。

```bash
cat <<EOF > ${SECRET_STORE_APP_ROLE_CREDS}
{
  "role_id" : "${ROLE_ID}",
  "secret_id" : "${SECRET_ID}"
}
EOF
```

6- このシーケンスは、ブローカーがブローカーのスコープ内でシークレットストアにアクセスすることをシミュレートしています。アクセス認証情報が有効であると仮定し、そうでない場合は失敗するはずです。

```bash
export ROLE_ID=$(cat ${SECRET_STORE_APP_ROLE_CREDS} \
  | jq -r '.role_id')

export SECRET_ID=$(cat ${SECRET_STORE_APP_ROLE_CREDS} \
| jq -r '.secret_id')
```

7- RoleID と SecretID を利用して、Vault へログインします。ログインした結果レスポンスされるトークンは、`APP_TOKEN` 環境変数にストアします。
```bash
# We defined this in the previous challenge.
#
export ROLE_NAME="pki-broker-role"

# Let's obtain our applicaiton token
#
export APP_TOKEN=$(vault write -format=json \
  auth/${ROLE_NAME}/login role_id=${ROLE_ID} \
  secret_id=${SECRET_ID} \
  | jq -r '.auth.client_token')

# This is the application token
#
echo ${APP_TOKEN}
```

Interactive mode
================

Step by Step に実行するのでは無く、下記スクリプトを実行し、設定する方法もあります。

```bash
05_broker_creds.bash
06_broker_auth.bash
```

Express mode
============

インタラクティブなプロンプトなしで構築する場合、以下を実行します。

```bash
echo | 05_broker_creds.bash -d 2> /dev/null
echo | 06_broker_auth.bash -d 2> /dev/null
```

