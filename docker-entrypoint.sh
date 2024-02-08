#!/bin/sh

if [ -n "$PIP_INSTALL" ]
then
    for i in $PIP_INSTALL
        do
            pip install "$i"
        done
fi

if [ -n "$TOKEN" ]; then
        tok="$TOKEN"@
else
        tok=""
fi

url=https://"$tok"github.com/"$USER"/"$REPO"

git clone --depth 1 --quiet "$url" || exit 1

cd $REPO || exit 1

exec "$@"
