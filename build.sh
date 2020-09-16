#!/bin/bash

CNAME="www.logan-davis.com"

### Cleaning Directory ###
rm -rf docs/*

### Building Site ###
hugo || exit 1

### Add cname file ###
echo ${CNAME} > docs/CNAME

### Add nojekyll file ###
touch docs/.nojekyll

### Commit Changes ### build argument is passed as message
git add -A
git commit -am "${1}"

### Push changes ###
git push origin master
