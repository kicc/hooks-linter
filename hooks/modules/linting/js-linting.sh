#!/usr/bin/env bash

. .git/hooks/modules/colors.sh
. .git/hooks/modules/util.sh

PROJECT=$(pwd)

FILES=$(git diff --diff-filter=ACMRT --cached --name-only | grep '\.jsx\|\.js\?$')

if [ "$FILES" != "" ]
then
    printTable ',' "${ORANGE}JS Linting...${NC}"
    printf "${LIGHT_CYAN}"
    printTable ' ' "$FILES"
    printf "${NC}"

    ./node_modules/eslint/bin/eslint.js --fix $FILES

    ERROR=$?
    if [ $ERROR != 0 ]
    then
        exit 1
    fi
fi