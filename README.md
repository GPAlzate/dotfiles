# NVIM and zshrc setup (Use iTerm2 so things look nice)

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
3. For coc extensions, run
'''
    python3 pip install --upgrade pip
    python3 -m pip install --user --upgrade pynvim
'''
to install a python3 provider (idk why just do it).
4. run `brew install ctags`

For this, check how everything is doing using `:checkhealth`

## CocConfig (coc-settings.json)

When in nvim, run `:CocConfig` and copy-paste from here :)
