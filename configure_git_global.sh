#!/bin/bash

read -p "Input git user name: " git_user_name
read -p "Input git user email: " git_user_email
read -p "Input http proxy: " git_http_proxy

read -p "OK? (y/N): " yn
case "$yn" in [yY]*) ;; *) echo "abort." ; exit ;; esac

# setup for personal
if [ -n "$git_user_name" ]; then
    git config --global user.name "${git_user_name}"
else
    echo "[INFO] git user name is not specified. If you want to reset it, type 'git config --global --unset user.name'."
    # git config --global --unset user.name
fi
if [ -n "$git_user_email" ]; then
    git config --global user.email ${git_user_email}
else
    echo "[INFO] git user email is not specified. If you want to reset it, type 'git config --global --unset user.email'."
    # git config --global --unset user.email
fi

# setup for proxy
if [ -n "$git_http_proxy" ]; then
	git config --global http.proxy ${git_http_proxy}
else
	echo "[INFO] http proxy is not specified. If you want to reset it, type 'git config --global --unset http.proxy'."
	# git config --global --unset http.proxy
fi


# setup for general
git config --global core.quotepath false
git config --global core.autocrlf false

# setup for remote access
# git config --global http.sslverify false

# setup for editor
git config --global core.editor "nvim"

# setup for difftool
git config --global diff.tool nvimdiff
git config --global difftool.nvimdiff.cmd 'nvim -d "$LOCAL" "$REMOTE"'

# setup for delta
if command -v delta >/dev/null 2>&1; then
  git config --global core.pager delta
  git config --global interactive.diffFilter 'delta --color-only'
  git config --global delta.navigate true
  git config --global delta.dark true
  git config --global merge.conflictStyle zdiff3
  git config --global delta.side-by-side true
  git config --global delta.line-numbers true
# git config --global delta.syntax-theme "GitHub"
# git config --global delta.syntax-theme "Monokai"
  git config --global delta.syntax-theme "Dracula"
else
  echo "delta is not installed. Delta-related git settings are skipped."
fi

# setup for color
git config --global color.ui auto
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto

# setup for ignore
git config --global core.excludesfile ~/.gitignore
touch ~/.gitignore

# show settings
echo .
echo "---------- Git configuratons are as follows. ----------"
git config --list

