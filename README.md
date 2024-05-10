# Manual MacOS setup

## `macos/`

### TouchID sudo auth

file: /etc/pam.d/sudo
add: auth sufficient pam_tid.so

[Article](https://dev.to/equiman/how-to-use-macos-s-touch-id-on-terminal-5fhg)

[PAM reattach Github](https://github.com/fabianishere/pam_reattach) works with tmux

### Shortcuts for Chrome

[Extension Shortkey](https://chrome.google.com/webstore/detail/shortkeys-custom-keyboard/logpjaacgmcbpdkdchjiaagddngobkck)

Send MacOS key:  
`osascript -e 'tell application "System Events"' -e 'key code 144' -e ' end tell'`

[Key Codes](https://web.archive.org/web/20160509091827/http://x86osx.com/bbs/c_data/pds_comment/MacintoshToolboxEssentials.pdf)

## `vscode/`

[How to use copilot in VScodium](https://ranguna.prose.sh/vscodium-and-copilot)

VScodium ext marketplace setup  
/Applications/{VScode}/Contents/Resources/app/product.json

```json
  "extensionsGallery": {
    "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
    "itemUrl": "https://marketplace.visualstudio.com/items",
    "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
    "controlUrl": ""
  }
```

## VScode keybinding

[when conditions](https://github.com/microsoft/vscode-docs/blob/25c3af239798a7bf0de9ed9adb52badfe4d989c4/api/references/when-clause-contexts.md)
[damp of commands](https://gist.github.com/skfarhat/4e88ef386c93b9dceb98121d9457edbf)
[WhichKey extension](https://vspacecode.github.io/docs/whichkey/extra/#conditional-bindings-experimental)
[Sidebar keybinding](https://stackoverflow.com/questions/59522776/is-there-a-vscode-action-to-close-the-sidebar-if-open-otherwise-do-nothing)


## Kanata

(setting up launch deamon)[https://github.com/kmonad/kmonad/issues/105]
