#!/usr/bin/env bash

#####################################################################
#
# Create Symlinks if not present
#
#####################################################################
if uname | grep -q "Darwin"; then
  PATH_VSCODE="$HOME/Library/Application Support/Code/User/settings.json"; # MAC Path for VSCode Settings
else
  $PATH_VSCODE="$HOME/.config/Code/User/settings.json"; # Linux Path for VSCode Setting
fi
PATH_ZSHRC="$HOME/.zshrc"
PATH_ATOM="$HOME/.atom/config.cson"
if [ ! -L $PATH_VSCODE ] && [ ! -L $PATH_ZSHRC ]; then
  echo "Symlinks Does not Exists, Creating them...";
  ln -s ${HOME}/Subroto/dotfiles/.zshrc $PATH_ZSHRC;
  ln -s ${HOME}/Subroto/dotfiles/vscode.json $PATH_VSCODE;
  rm ${PATH_ATOM} #Remove if already present...
  ln -s ${HOME}/Subroto/dotfiles/atom.cson $PATH_VSCODE;
else
  echo "Symlinks Exists..."
fi
