#!/bin/sh

if [ -n "$INSTALL" ]; then
        if command -v apt > /dev/null; then
                apt update && apt install "$INSTALL" -y
        elif command -v apk > /dev/null; then
                apk add "$INSTALL"
        fi
fi

if [ -n "$PIP_INSTALL" ]; then
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

if [ -n "$REPO" ] && [ -n "$USER" ]; then
        rm -rf "$REPO"
        url=https://"$tok"github.com/"$USER"/"$REPO"
        git clone --depth 1 "$url" || exit 1
        cd "$REPO" || exit 1
fi

exec "$@"
