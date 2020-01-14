#!/bin/bash

read -p "Input git user name: " git_user_name
read -p "Input git user email: " git_user_email
read -p "Input http proxy: " git_http_proxy

read -p "OK? (y/N): " yn
case "$yn" in [yY]*) ;; *) echo "abort." ; exit ;; esac

# setup for general
git config --global user.name "${git_user_name}"
git config --global user.email ${git_user_email}	
git config --global core.quotepath false
git config --global core.autocrlf false

# setup for remote access
git config --global http.sslverify false

if [ -n "$git_http_proxy" ]; then
	git config --global http.proxy ${git_http_proxy}
else
	git config --global --unset http.proxy
fi

# setup for editor
git config --global core.editor 'vim -c "set fenc=utf-8"'

# setup for diff
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto

# show settings
echo .
echo "+++ Git configuratons are as follows. +++"
git config --list

