#! /bin/bash

git config --global user.name "bloodmud"
git config --global user.email "bloodmud@gmail.com"

git config --global push.default simple
git config --global merge.tool meld

# Caching password for github.com
# Default: 15 minutes
# git config --global credential.helper cache
# Custom: 60 minutes
git config --global credential.helper "cache --timeout=3600"

