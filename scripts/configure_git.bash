#!/bin/bash
# Copyright (c) HashiCorp, Inc.


typewriter() {
    delay=0.005
    string=$1
    len=${#string}

    for char in $(seq 0 $len); do
        printf "%c" "${string:$char:1}"
        sleep $delay
    done
    echo
}

ctab() {
  printf -- "$@%.0s" {1..50}
  printf "\n\n"
}

cyellow() {
    YELLOW='\033[0;33m'
    printf "${YELLOW}"
}

cnone() {
    NC='\033[0m'
    printf "${NC}"
}

clear
echo -e '\033[2K'

note="  Gitは、コミットをIDに関連付けるためにユーザー名を使用します。
  これは、管理対象となるGitHubの組織や個人のユーザーアカウントです。

  例えば、

    Username: shiffman
    Organization: shiffman
    URL: https://github.com/shiffman

  この値を使って、環境変数GITHUB_OWNERを設定します。"

cyellow
ctab "-"
typewriter "${note}"
cnone

# git_user=
# while [[ $git_user = "" ]]; do
  echo -e '\033[2K'
  read -p " Github Username: " git_user
  echo ""
# done

note="  organizationフィールドはownerと同じとみなせるため、多くの場合、ownerの値を利用することができます。
  
  この値を使用して、GITHUB_ORGANIZATION環境変数を設定します。
  
  デフォルトを受け入れるには、returnを押します。あるいは、別の GitHub Organization を入力することもできます。"

cyellow
ctab "-"
typewriter "${note}"
cnone

echo -e '\033[2K'
read -p " Github Organization [${git_user}]: " git_org
echo ""

note="  GitHub OAuth / Personal Access Token.

  この値を使って、環境変数GITHUB_TOKENを設定します。
    
  ここに文字列を貼り付けてください。値は表示されません。"

cyellow
ctab "-"
typewriter "${note}"
cnone

echo -e '\033[2K'
read -s -p " Github Token: " git_token

echo ""
echo ""
note="  GitHubは、コミットをGitHub.comのあなたのアカウントと関連付けるために、あなたのメールアドレスを使用します。"

cyellow
ctab "-"
typewriter "${note}"
cnone

echo -e '\033[2K'
read -p " User Email: " user_email
echo ""

if [ -z "$git_org" ]
then
  git_org=$git_user
fi

# echo $git_user
# echo $git_org
# echo $user_email
# echo $git_token

# これらはTerraform GitHub Repoのランタイム変数です。
# ターミナルを再読み込みする必要がないようにこのような設定になっています。

export GITHUB_ORGANIZATION=$git_org
export GITHUB_TOKEN=$git_token
export GITHUB_OWNER=$git_user
export GITHUB_REPO="hashicat-app"

export USER_EMAIL="${user_email}"
export USER_NAME="${git_user}"


# GitHubのリポジトリ管理用のTerraform変数です。
# TerraformのGitHubのorg codeにこれらを使っています。

if grep -wq "GITHUB_OWNER" "/root/.bashrc"; then
  sed -i -r "s|(export GITHUB_OWNER=)(.+)?$|\1$GITHUB_OWNER|g" /root/.bashrc
else
  echo "export GITHUB_OWNER=${GITHUB_OWNER}" >> /root/.bashrc
fi

if grep -wq "GITHUB_ORGANIZATION" "/root/.bashrc"; then
  sed -i -r "s|(export GITHUB_ORGANIZATION=)(.+)?$|\1$GITHUB_ORGANIZATION|g" /root/.bashrc
else
  echo "export GITHUB_ORGANIZATION=${GITHUB_ORGANIZATION}" >> /root/.bashrc
fi

if grep -wq "GITHUB_TOKEN" "/root/.bashrc"; then
  sed -i -r "s|(export GITHUB_TOKEN=)(.+)?$|\1$GITHUB_TOKEN|g" /root/.bashrc
else
  echo "export GITHUB_TOKEN=${GITHUB_TOKEN}" >> /root/.bashrc
fi

if grep -wq "GITHUB_REPO" "/root/.bashrc"; then
  sed -i -r "s|(export GITHUB_REPO=)(.+)?$|\1$GITHUB_REPO|g" /root/.bashrc
else
  echo "export GITHUB_REPO=${GITHUB_REPO}" >> /root/.bashrc
fi

# VCS接続用のTerraform変数です。
# これらをTerraform Cloud WorkspaceとPMR Moduleに利用します。
# より具体的には、以下のタイミングでこれらを使用します：
#
# 1. VCS接続の作成時、および、
# 2. GitHubからPMR Moduleをロードする際。

export TF_VAR_github_organization=$GITHUB_ORGANIZATION
export TF_VAR_github_token=$GITHUB_TOKEN
export TF_VAR_github_repo=$GITHUB_REPO

if grep -wq "TF_VAR_github_organization" "/root/.bashrc"; then
  sed -i -r "s|(export TF_VAR_github_organization=)(.+)?$|\1$GITHUB_ORGANIZATION|g" /root/.bashrc
else
  echo "export TF_VAR_github_organization=${GITHUB_ORGANIZATION}" >> /root/.bashrc
fi

if grep -wq "TF_VAR_github_token" "/root/.bashrc"; then
  sed -i -r "s|(export TF_VAR_github_token=)(.+)?$|\1$GITHUB_TOKEN|g" /root/.bashrc
else
  echo "export TF_VAR_github_token=${GITHUB_TOKEN}" >> /root/.bashrc
fi

if grep -wq "TF_VAR_github_repo" "/root/.bashrc"; then
  sed -i -r "s|(export TF_VAR_github_repo=)(.+)?$|\1$GITHUB_REPO|g" /root/.bashrc
else
  echo "export TF_VAR_github_repo=${GITHUB_REPO}" >> /root/.bashrc
fi

echo -e '\033[2K'

note=" Thank you. We will use the following information locally:

    Username:     ${GITHUB_OWNER}
    Organization: ${GITHUB_ORGANIZATION}
    URL:          https://github.com/${GITHUB_ORGANIZATION}
    Git PAT:      **********

"

cyellow
ctab "-"
typewriter "${note}"
cnone