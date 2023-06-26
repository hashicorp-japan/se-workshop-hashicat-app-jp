---
slug: create-an-intermediate-certificate-authority
id: jqstyzonb39l
type: challenge
title: Create an Intermediate Certificate Authority
teaser: 中間 CA（認証局）を構築します。
notes:
- type: text
  contents: '![Create a Intermediate Certificate](../assets/intermediate_cert.png)'
tabs:
- title: Explainer
  type: service
  hostname: shell
  path: /six
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
中間 CA（認証局）の構築
============================================

中間 CA を Vault で定義するのは、ルート CA と統合する際の Vault Vault PKI シークレットエンジンの最も一般的な使用例になります。

Step by step
============

Vault を操作するために、`Terminal` タブを使用します。

1- パス `hashicat-ca-intermediate` で PKI シークレットエンジンを有効にします。
```bash
vault secrets enable \
  -path hashicat-ca-intermediate pki
```

中間 CA として利用するために定義した PKI シークレットエンジンがパス `hashicat-ca-intermediate` で有効化された事を確認します。
```bash
vault secrets list
```

2- `hashicat-ca-intermediate` の最大リース期間を 24h に設定します。
```bash
vault secrets tune \
  -max-lease-ttl=24h \
  -description="Intermediate Certificate Authority" \
  hashicat-ca-intermediate
```

3- `hashicat-ca-intermediate` の証明書署名リクエスト (CSR) を生成します。
```bash
vault write -format=json hashicat-ca-intermediate/intermediate/generate/internal \
  common_name="hashicat-ca-intermediate" \
  ttl=60m | tee \
  >(jq -r .data.csr > ${CERTS_HOME}/hashicat-ca-intermediate.csr)
```

4- 先ほど作成したルート CA で `hashicat-ca-intermediate` の CSR に署名します。
```bash
vault write -format=json hashicat-ca-root/root/sign-intermediate \
  csr=@${CERTS_HOME}/hashicat-ca-intermediate.csr \
  common_name="hashicat.io" \
  ttl=24h | tee \
  >(jq -r .data.certificate > ${CERTS_HOME}/hashicat-ca-intermediate_certificate.pem) \
  >(jq -r .data.issuing_ca > ${CERTS_HOME}/hashicat-ca-intermediate_issuing_ca.pem)
```

5- 生成した証明書を中間 CA `hashicat-ca-intermediate` にインポートします。
```bash
vault write hashicat-ca-intermediate/intermediate/set-signed \
  certificate=@${CERTS_HOME}/hashicat-ca-intermediate_certificate.pem
```

6- `hashicat-ca-intermediate` の証明書発行元 URL と証明書取消リストを設定します。
```bash
vault write hashicat-ca-intermediate/config/urls \
  issuing_certificates="http://127.0.0.1:8200/v1/hashicat-ca-intermediate/ca" \
  crl_distribution_points="http://127.0.0.1:8200/v1/hashicat-ca-intermediate/crl"
```

7- 定義した中間 CA `hashicat-ca-intermediate` を利用して、証明書を発行するために、Vault PKI ロールを設定します。PKI ロールは、発行する証明書に与える権限の論理名のようなものになります。

発行を許可するドメイン、サブドメインの利用可否、ワイルドカードドメインの利用可否等を設定します。
```bash
vault write hashicat-ca-intermediate/roles/hashicat-int-role \
    allowed_domains=dev.hashicat.io \
    allow_subdomains=true \
    max_ttl=5m \
    generate_lease=true
```

8- 上記のステップ4で生成した証明書を用いて、ドメイン `dev.hashicat.io` に対する CA バンドルを作成します。
```bash
cat \
  ${CERTS_HOME}/hashicat-ca-intermediate_issuing_ca.pem \
  ${CERTS_HOME}/hashicat-ca-intermediate_certificate.pem \
  > ${CERTS_HOME}/hashicat-ca-intermediate_ca_bundle.crt
```

Interactive mode
================

Step by Step に実行するのでは無く、下記スクリプトを実行し、設定する方法もあります。

```bash
03_setup_intermediate.bash
```

Express mode
============

インタラクティブなプロンプトなしで構築する場合、以下を実行します。

```bash
echo | 03_setup_intermediate.bash -d 2> /dev/null
```

