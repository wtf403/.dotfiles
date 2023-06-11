#!/usr/bin/env bash

UserData="$HOME/Library/Application Support/VSCodium/User"
UserConfig="$HOME/.vscode-oss"

mkdir -p $UserConfig 2>/dev/null
for file in "$UserData"/*.json
do
    cp -R "${file}" "${UserConfig}/"
done

cp -R "${UserData}/snippets" "${UserConfig}/"

codium --list-extensions > "${UserConfig}/.extensions"
