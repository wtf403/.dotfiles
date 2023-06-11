#!/usr/bin/env bash

UserConfig="$HOME/.vscode-oss"
UserData="$HOME/Library/Application Support/VSCodium/User"

for file in "$UserConfig"/*.json
do
    cp -R "${file}" "${UserData}/"
done

cp -R "${UserConfig}/snippets" "${UserData}/"

cat .extensions | while read extension || [[ -n $extension ]];
do
  codium --install-extension $extension --force
done

