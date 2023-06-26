---
slug: bootstrap-environment
id: tvdbsjqaj8mw
type: challenge
title: Bootstrap Environment
teaser: HashiCorp Vault の構成を確認し、PKI シークレットエンジンの導入を計画します。
notes:
- type: text
  contents: '![Bootstrap](../assets/bootstrap.png)'
tabs:
- title: Explainer
  type: service
  hostname: shell
  port: 5000
- title: Vault UI
  type: service
  hostname: shell
  port: 8200
- title: Terminal
  type: terminal
  hostname: shell
difficulty: basic
timelimit: 7380
---

Getting started
===============

Vault の Web UI とコマンドラインインターフェイスを使用して、Vault にアクセスします。

Explore the Web UI
==================

Web UI にログインするには、`Vault UI` タブを使用します。ログインには、**root token** を使用します。

トークンは `Explainer` タブを開いて頂き、右下にある「>」をクリックして頂き、ページをめくって頂くと取得できます。

また、`Terminal` タブから以下のコマンドでルートトークンを取得することもできます。

```
env | grep -i vault_token
```

`hvs` で始まる文字列をコピーします。

Step by step
============

Vault を操作するには、`Terminal` タブを使用します。

Vault のステータスを確認します.
```bash
vault status
```

現在のアイデンティティ（環境変数 `VAULT_TOKEN` に設定されているトークン）の情報を確認します。
```bash
vault token lookup
```

現在有効になっている Vault のシークレットエンジンをリストします。
```bash
vault secrets list
```
