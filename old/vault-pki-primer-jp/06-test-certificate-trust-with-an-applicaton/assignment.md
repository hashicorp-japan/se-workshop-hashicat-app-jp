---
slug: test-certificate-trust-with-an-applicaton
id: 5uxxlyxwt9rx
type: challenge
title: Test certificate trust with an application
teaser: クライアントとサーバーのリーフ証明書の配布します。
notes:
- type: text
  contents: '![Test certificate trust with an application](../assets/test_cert.png)'
tabs:
- title: Explainer
  type: service
  hostname: shell
  path: /nine
  port: 5000
- title: Vault UI
  type: service
  hostname: shell
  port: 8200
- title: Server
  type: terminal
  hostname: shell
- title: Client
  type: terminal
  hostname: shell
difficulty: basic
timelimit: 600
---

Test certificates trusts with an application
============================================

アプリケーション用のサーバ証明書とクライアント証明書を作成します。これらのコマンドは `Server` または `Client` タブのどちらかで実行することができます。

Step by step
============

1- このシーケンスは、アプリが AppRole を利用して、Vault で認証を行い、レスポンスされたトークンを用いて、証明書を発行するというワークフローをシミュレートしています。

```bash
export ROLE_ID=$(cat ${SECRET_STORE_APP_ROLE_CREDS} | jq -r '.role_id')
export SECRET_ID=$(cat ${SECRET_STORE_APP_ROLE_CREDS} | jq -r '.secret_id')
```

2.1- RoleID と SecretID を使って Vault で認証を行い、レスポンスされたトークンを `APP_TOKEN` 環境変数に設定します。

```bash
export APP_TOKEN=$(vault write -format=json \
  auth/${ROLE_NAME}/login role_id=${ROLE_ID} \
  secret_id=${SECRET_ID} \
  | jq -r '.auth.client_token')
```

2.2- トークンを取得するために利用した、RoleID、SecretID、認証の結果レスポンスされたトークンを確認します。
```bash
echo ${ROLE_ID}
echo ${SECRET_ID}
echo ${APP_TOKEN}
```

3- レスポンスされたトークンを環境変数 `VAULT_TOKEN` に設定し、トークンの詳細を確認します。

```bash
unset VAULT_TOKEN
export VAULT_TOKEN=${APP_TOKEN}

vault token lookup
```

AppRole のロール `pki-broker-role` に設定した Vault ポリシー `pki-broker-policy` がトークンに付与されている事が確認できます。

4- ターゲットとなるアプリケーションサーバーの CA バンドルをコピーします。

```bash
cp ${CERTS_HOME}/${InterimCAName}_ca_bundle.crt ${APP_HOME}/ca_bundle.crt
```

5.1- `server` アプリケーション証明書を生成します。

```bash
export APP_NAME="app1.dev"
export CRT_CONSUMER_ROLE="server"

vault write -format=json \
  ${InterimCAName}/issue/${IntRoleName} \
  common_name=${APP_NAME}.${CommonName} \
  > "${CERTS_HOME}/${APP_NAME}.${CommonName}-${CRT_CONSUMER_ROLE}.json"
```

5.2- `server` のペイロードは JSON ファイルに格納されています。通常、このデータは保存しません。ここでは、証明書チェーンを構築するためにペイロードの一部を抽出することを説明するために使用しています。

```bash
cat "${CERTS_HOME}/${APP_NAME}.${CommonName}-${CRT_CONSUMER_ROLE}.json" |  tee \
>(jq -r .data.ca_chain    > "${CERTS_HOME}/${APP_NAME}.${CommonName}-${CRT_CONSUMER_ROLE}_ca_chain.pem") \
>(jq -r .data.certificate > "${CERTS_HOME}/${APP_NAME}.${CommonName}-${CRT_CONSUMER_ROLE}_certificate.pem") \
>(jq -r .data.issuing_ca  > "${CERTS_HOME}/${APP_NAME}.${CommonName}-${CRT_CONSUMER_ROLE}_issuing_ca.pem") \
>(jq -r .data.private_key > "${CERTS_HOME}/${APP_NAME}.${CommonName}-${CRT_CONSUMER_ROLE}_private_key.pem")
```

5.3- テスト用に `server` の証明書をアプリケーションフォルダにコピーします。

```bash
cp ${CERTS_HOME}/${APP_NAME}.${CommonName}-${CRT_CONSUMER_ROLE}_private_key.pem ${APP_HOME}/server.key
cp ${CERTS_HOME}/${APP_NAME}.${CommonName}-${CRT_CONSUMER_ROLE}_certificate.pem ${APP_HOME}/server.crt
```

6.1- `client` のアプリケーション証明書を生成します。

```bash
export APP_NAME="app1.dev"
export CRT_CONSUMER_ROLE="client"

vault write -format=json \
  ${InterimCAName}/issue/${IntRoleName} \
  common_name=${APP_NAME}.${CommonName} \
  > "${CERTS_HOME}/${APP_NAME}.${CommonName}-${CRT_CONSUMER_ROLE}.json"
```

6.2- `client` のペイロードは JSON ファイルに格納されています。通常、このデータは保存しません。ここでは、証明書チェーンを構築するためにペイロードの一部を抽出することを説明するために使用しています。

```bash
cat "${CERTS_HOME}/${APP_NAME}.${CommonName}-${CRT_CONSUMER_ROLE}.json" |  tee \
>(jq -r .data.ca_chain    > "${CERTS_HOME}/${APP_NAME}.${CommonName}-${CRT_CONSUMER_ROLE}_ca_chain.pem") \
>(jq -r .data.certificate > "${CERTS_HOME}/${APP_NAME}.${CommonName}-${CRT_CONSUMER_ROLE}_certificate.pem") \
>(jq -r .data.issuing_ca  > "${CERTS_HOME}/${APP_NAME}.${CommonName}-${CRT_CONSUMER_ROLE}_issuing_ca.pem") \
>(jq -r .data.private_key > "${CERTS_HOME}/${APP_NAME}.${CommonName}-${CRT_CONSUMER_ROLE}_private_key.pem")
```

6.3- テスト用の `client` 証明書をアプリケーションフォルダにコピーします。

```bash
cp ${CERTS_HOME}/${APP_NAME}.${CommonName}-${CRT_CONSUMER_ROLE}_private_key.pem ${APP_HOME}/client.key
cp ${CERTS_HOME}/${APP_NAME}.${CommonName}-${CRT_CONSUMER_ROLE}_certificate.pem ${APP_HOME}/client.crt
```

Interactive mode
================
Step by Step に実行するのでは無く、下記スクリプトを実行し、設定する方法もあります。

```bash
07_broker_csrs.bash
```

Express mode
============
インタラクティブなプロンプトなしで構築する場合、以下を実行します。

```bash
echo | 07_broker_csrs.bash -d 2> /dev/null
```

