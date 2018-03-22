#!/usr/bin/env bash

# FIRST Use Ansible to Install all the Import Softwares and Command Line Tools

# Use git clone to Clone the Repo first in default Folder, mine here is Subroto
PATH_LOCAL_HOME="${HOME}/Subroto";
if [ ! -d ${PATH_LOCAL_HOME} ]; then
  mkdir ${PATH_LOCAL_HOME};
cd ${PATH_LOCAL_HOME}; git clone git@github.com:Shub1427/dotfiles.git

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
  ln -s ${PATH_LOCAL_HOME}/dotfiles/.zshrc $PATH_ZSHRC;
  ln -s ${PATH_LOCAL_HOME}/dotfiles/vscode.json $PATH_VSCODE;
  rm ${PATH_ATOM} #Remove if already present...
  ln -s ${PATH_LOCAL_HOME}/dotfiles/atom.cson $PATH_VSCODE;
else
  echo "Symlinks Exists..."
fi

#####################################################################
#
# Download and Install Atom Packages
#
#####################################################################
$(apm install atom-import-js copy-path file-icons highlight-selected local-history related set-syntax atom-wrap-in-tag atom-ternjs autoclose-html autocomplete-modules docblockr emmet emmet-jsx-css-modules es6-javascript js-hyperclick hyperclick tree-view-copy-relative-path
language-babel react-es7-snippets atom-jest-snippets);
