#!/bin/bash

read -p "Input git user name: " git_user_name
read -p "Input git user email: " git_user_email

read -p "OK? (y/N): " yn
case "$yn" in [yY]*) ;; *) echo "abort." ; exit ;; esac

# setup user for local.
if [ -n "$git_user_name" ]; then
	git config user.name "${git_user_name}"
else
	git config --unset user.name
fi

if [ -n "$git_user_email" ]; then
	git config user.email ${git_user_email}
else
	git config --unset user.email
fi

# show settings
echo .
echo "+++ Git configuratons are as follows. +++"
git config --list

