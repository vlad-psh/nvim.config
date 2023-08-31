# Prerequisites

* https://github.com/junegunn/vim-plug
* https://github.com/junegunn/fzf
* https://github.com/BurntSushi/ripgrep

## LSP

```shell
# Ruby
gem install --user-install solargraph solargraph-rails

# Lua
# https://luals.github.io/#neovim-install 
brew install lua-language-server

# TypeScript
npm install -g typescript typescript-language-server

# Volar (vue.js)
npm install -g @vue/language-server
```

~/.config/solargraph/config.yml

```
plugins:
  - solargraph-rails
```
