---
slug: create-a-root-certificate-authority
id: rnfs6yy63nxy
type: challenge
title: Create a Root Certificate Authority
teaser: プライベートなルート CA（認証局）を構築します。
notes:
- type: text
  contents: '![Create a Root Certificate](../assets/root_cert.png)'
tabs:
- title: Explainer
  type: service
  hostname: shell
  path: /four
  port: 5000
- title: Vault UI
  type: service
  hostname: shell
  port: 8200
- title: Terminal
  type: terminal
  hostname: shell
difficulty: basic
timelimit: 240
---
ルート CA（認証局）の構築
================================

ここでのユースケースは、ルート認証局サービスを必要とするプライベートな環境に関連するものになります。

Step by step
============

Vault の設定を行なっていくために、`Terminal` タブを使用します。

1- パス `hashicat-ca-root` で PKI シークレットエンジンを有効にします。
```bash
vault secrets enable \
  -path hashicat-ca-root pki
```

ルート CA として定義する PKI シークレットエンジンがパス `hashicat-ca-root` で有効になった事を確認します。
```bash
vault secrets list
```

2- ルート CA（認証局）の最大リース期間を 24h に設定します。
```bash
vault secrets tune \
  -max-lease-ttl=24h \
  -description="Root Certificate Authority" \
  hashicat-ca-root
```

3- `hashicat.io` のルート証明書と CA チェインを生成します。
```bash
vault write -format=json hashicat-ca-root/root/generate/internal \
  common_name="hashicat.io" \
  province="Ontario" \
  organization="HashiCat Software" \
  ttl=24h | tee \
    >(jq -r .data.certificate > $CERTS_HOME/hashicat-ca-root_certicate.pem) \
    >(jq -r .data.issuing_ca  > $CERTS_HOME/hashicat-ca-root_issuing_ca.pem)
```

4- `hashicat.io` の証明書発行元 URL と証明書取消リスト (CRL) を設定します。
```bash
vault write hashicat-ca-root/config/urls \
  issuing_certificates="http://127.0.0.1:8200/v1/hashicat-ca-root/ca" \
  crl_distribution_points="http://127.0.0.1:8200/v1/hashicat-ca-root/crl"
```

5- 定義した CA を利用して、証明書を発行するために、Vault PKI ロールを設定します。PKI ロールは、発行する証明書に与える権限の論理名のようなものになります。

発行を許可するドメイン、サブドメインの利用可否、ワイルドカードドメインの利用可否等を設定します。

```bash
vault write hashicat-ca-root/roles/hashicat-ca-role \
  allowed_domains="hashicat.io" \
  allow_subdomains="true" \
  max_ttl=5m
```

6- 上記で作成した PKI ロールが機能し、サブドメインを指定し、証明書が発行できることを確認します。例: `dev.hashicat.io`
```bash
vault write -format=json hashicat-ca-root/issue/hashicat-ca-role \
  common_name="dev.hashicat.io" \
  province="Ontario" \
  organization="HashiCat Software" \
  ttl=24h | tee \
    >(jq -r .data.certificate > $CERTS_HOME/hashicat-ca-root_dev.hashicat.io_certicate.pem) \
    >(jq -r .data.issuing_ca  > $CERTS_HOME/hashicat-ca-root_dev.hashicat.io_issuing_ca.pem) \
    >(jq -r .data.private_key > $CERTS_HOME/hashicat-ca-root_dev.hashicat.io_private_key.key)
```

Interactive mode
==============

Step by Step に実行するのでは無く、下記スクリプトを実行し、設定する方法もあります。

```bash
02_setup_root_ca.bash
```

Express mode
============

インタラクティブなプロンプトなしで構築する場合、以下を実行します。

```bash
echo | 02_setup_root_ca.bash -d 2> /dev/null
```

