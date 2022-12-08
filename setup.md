# Setup

## Preparation
- Install Alactritty or some terminal first
- Install `brew`
- `brew install`
    - pyenv
    - fish
    - neofetch
    - fzf
        - Should also install key_bindings: `$(brew --prefix)/opt/fzf/install`
    - tmux
- `curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish`
    - `omf install budspencer`
- `git clone` this repo
- install nerd-fonts using brew
    - `brew tap homebrew/cask-fonts && brew install --cask font-victor-mono-nerd-font`
    - Details here: https://gist.github.com/davidteren/898f2dcccd42d9f8680ec69a3a5d350e

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
ln -s $HOME/personal/dotfiles/.config/alacritty/ ~/.config/alacritty

# Symlink OMF conf
ln -s $HOME/personal/dotfiles/.config/omf ~/.config/omf

# Symlink tmux conf
ln -s $HOME/personal/dotfiles/.tmux.osx.conf ~/.tmux.conf

# Symlink vim config
ln -s $HOME/personal/dotfiles/.vim ~/.vim 

# Symlink office git config
ln -s $HOME/personal/dotfiles/.ofc.gitconfig ~/.gitconfig

```