#!/bin/bash

set -e

if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory_name>"
    exit 1
fi

DIR_NAME=$1

git clone git@github.com:zen-code-symphony/django-scaffold.git
mv django-scaffold "$DIR_NAME"
cd "$DIR_NAME"
rm -rf .git
git init
make init
source app/venv/bin/activate
