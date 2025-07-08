#!/bin/sh

if [ -n "$INSTALL" ]; then

	if command -v apt >/dev/null; then
		apt update
		for i in $INSTALL; do
			apt install --no-install-recommends "$i" -y
		done
		rm -rf /var/lib/apt/lists/* /var/cache/apt/archives

	elif command -v apk >/dev/null; then
		apk update
		for i in $INSTALL; do
			apk add "$i"
		done
		rm -rf /var/cache/apk/*
	fi
fi

if [ -n "$PIP_INSTALL" ]; then
	for i in $PIP_INSTALL; do
		pip install "$i" --root-user-action=ignore
	done
	pip cache purge
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

if [ -n "$DIRECTORY" ]; then
	cd "$DIRECTORY" || exit 1
fi

if [ -n "$AUTO_INSTALL" ]; then
	for file in *.py; do
		[ -e "$file" ] || break
		for package in $(cat "$file" | grep import | cut -d ' ' -f 2); do
			pip install "$package" --root-user-action=ignore
		done
		pip cache purge
	done
fi

exec "$@"
