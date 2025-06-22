# Setup

- use `*.mac.*` for personal mac configs
- `*.ofc.*` are for work config settings
- Default configs are used for my Linux machine

## Preparation
- Install Alactritty or some terminal first
  - Config might have deprecated fields
  - So test by running alacritty first using Linux/Mac terminal
  - Install alacritty theme inside `~/.config/alacritty` folder
    - Check https://github.com/alacritty/alacritty-theme
  - Install terminfo:
    - `curl -sSL https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.info | tic -x -`
- Install `brew`
    - Follow https://stackoverflow.com/questions/66724016/my-fish-is-blind-fish-does-not-recognise-any-commands-after-setting-it-as-defa to setup brew on M1 and fish shell
- `brew install`
    - pyenv
      - Also install https://github.com/pyenv/pyenv-virtualenv
    - fish
      - Follow this to set fish as default shell in some cases: https://github.com/fish-shell/fish-shell/issues/989
      - I am using fisher for installing fish plugins: https://github.com/jorgebucaran/fisher
      - And am using `tide` for theming: https://github.com/IlanCosman/tide
    - neofetch
    - fzf
        - Should also install key_bindings: `$(brew --prefix)/opt/fzf/install`
    - tmux
      - Tmux plugins need more setup
      - `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
      - Press prefix + I (capital i, as in Install) to fetch the plugin.
      - Read more details here: https://github.com/tmux-plugins/tpm
-
- `git clone` this repo
- install nerd-fonts using brew
    - `brew install font-victor-mono-nerd-font`
    - Details here: https://gist.github.com/davidteren/898f2dcccd42d9f8680ec69a3a5d350e

I have moved away from OMF. In case I ever switch back, I can use the following steps
- OMF installation: `curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish`
    - `omf install budspencer`

## Essential Rust CLI Tools:

- `bat`
- `git-delta`
- `exa`
- `bottom` for htop replacement

## Gotchas:

- `fzf` - adds a symlink `.config/fish/functions/fzf_key_bindings.fish`,
  which right now is commited to my old directory path. This needs to change
  and should point to right location in `~/.fzf/` directory.
  Thus do make sure to install `fzf` fish shell keybindings

## Symlinking
- Commands to symlink various configs after this

```sh
# remove previously setup fish config
rm -rf ~/.config/fish/
# Symlink new fish config
ln -s $HOME/personal/dotfiles/.config/fish/ ~/.config/fish

# Remove and symlink neofetch
rm -rf ~/.config/neofetch/
ln -s $HOME/personal/dotfiles/.config/neofetch/ ~/.config/neofetch

# Symlink Alacritty config
ln -s $HOME/personal/dotfiles/.config/alacritty/alacritty.ofc.toml ~/.config/alacritty/alacritty.toml

# Link gitconfig
ln -s $HOME/personal/dotfiles/.mac.gitconfig ~/.gitconfig

# Symlink OMF conf
ln -s $HOME/personal/dotfiles/.config/omf ~/.config/omf

# Symlink tmux conf
ln -s $HOME/personal/dotfiles/.tmux.osx.conf ~/.tmux.conf

# Symlink vim config
ln -s $HOME/personal/dotfiles/.vim ~/.vim

# Symlink office git config
ln -s $HOME/personal/dotfiles/.ofc.gitconfig ~/.gitconfig

```
