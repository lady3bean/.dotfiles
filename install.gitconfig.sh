#!/bin/bash
set -e

git config --global user.name "Hawley Brett"
git config --global user.email "AnneHawleyBrett@gmail.com"

git config --global alias.ap "!git add -N \${1:-.} && git add -p \$1 && git status"
git config --global alias.br "branch"
git config --global alias.co "checkout"
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
git config --global alias.pr "!f() { git fetch -fu \${2:-\$(git remote |grep ^upstream || echo origin)} refs/pull/\$1/head:pr/\$1 && git checkout pr/\$1; }; f"
git config --global alias.pr-clean '!git for-each-ref refs/heads/pr/* --format="%(refname)" | while read ref ; do branch=${ref#refs/heads/} ; git branch -D $branch ; done'
git config --global alias.undo "reset --hard"

git config --global core.autocrlf input
git config --global core.excludesfile $HOME/.gitexcludes

cat > $HOME/.gitexcludes <<__EOF__
.DS_Store
__EOF__

git config --global color.ui auto
git config --global push.default simple