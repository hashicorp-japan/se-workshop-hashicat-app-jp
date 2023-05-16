#!/bin/bash
# Copyright (c) HashiCorp, Inc.

# シンプルなウェブアプリケーションをデプロイするためのスクリプトです。
# このウェブアプリケーションにはカスタマイズ可能なイメージとテキストが含まれています。

cat << EOM > /var/www/html/index.html
<html>
  <head>
  <meta charset="utf-8">
  <title>Meow!</title>
  </head>
  <body>
  <div style="width:800px;margin: 0 auto">

  <!-- BEGIN -->
  <center><img src="http://${PLACEHOLDER}/${WIDTH}/${HEIGHT}"></img></center>
  <center><h2>Meow World!</h2></center>
  ${PREFIX}のウェブサイトにようこそ。このテキストをご自身で変更してください。
  <!-- END -->

  </div>
  </body>
</html>
EOM

echo "Script complete."
