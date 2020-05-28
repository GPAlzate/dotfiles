# NVIM and zshrc setup

First install [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
using:
```
brew install ripgrep
```

Then install [fzf](https://github.com/junegunn/fzf) using:
```
brew install fzf
```

## Zsh (zshrc)

1. Install [zinit](https://github.com/zdharma/zinit).

## nvim (init.vim)

1. Install [nvim](https://github.com/neovim/neovim/wiki/Installing-Neovim).
2. Install [vim-plug](https://github.com/junegunn/vim-plug). Be sure to use the
   Neovim link, not the Vim one.
    - For `coc.nvim`, need to install [nodejs](https://nodejs.org/en/download/).
    - TODO: fix `vimtex_compiler`

For this, check how everything is doing using `:checkhealth`

## CocConfig (coc-settings.json)

When in nvim, run `:CocConfig` and copy-paste from here :)
