. ~/.config/fish/git.alias.fish
. ~/.config/fish/docker.alias.fish
. ~/.config/fish/misc.alias.fish

switch (uname)
case Linux
  # Need to change this
  set -g DENO_INSTALL "/home/phoenix/.deno"
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output'
case Darwin
  set -g DENO_INSTALL "/Users/shub/.deno"
  # Check this for details: https://github.com/oh-my-fish/theme-budspencer/issues/57#issuecomment-551452088
  set -gx PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
  set -gx PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH
case '*'
  set -g DENO_INSTALL "/Users/shub/.deno"
end

# Theme Settings for OMF
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes

if type -q brew
  set -gx NVM_DIR (brew --prefix nvm)
end
set -gx PATH ~/go/bin/ ~/.cargo/bin (echo "$DENO_INSTALL/bin") /opt/homebrew/bin/ /usr/local/bin $PATH

switch (uname)
case Linux
  # Do nothing for now
case Darwin
 set -gx PATH "$(pyenv root)/shims" $PATH
 set -gx PATH "$HOME/Library/Python/3.10/bin/" $PATH
 set -gx PATH "$HOME/3rd-party/depot_tools"  $PATH
#  set -gx DOCKER_DEFAULT_PLATFORM "linux/amd64"
case '*'
  # Do nothing for now
end

################
# Setup deno path, as it's stored in user directory now, when
# using Deno's own install script
################

if test -e ~/.deno
  set -gx DENO_INSTALL "$HOME/.deno"
  set -gx PATH "$DENO_INSTALL/bin/" $PATH
end

################
# Setup Sublime in terminal
################

if test -e /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/
  set -gx PATH "/Applications/Sublime Text.app/Contents/SharedSupport/bin/" $PATH
end

#######
# brew install pyenv
# pyenv install 2.7.18 or 3.x
# pyenv global 2.7.18
# ---
# pyenv init --path
#######
if type -q pyenv
  while set index (contains -i -- '/Users/shub/.pyenv/shims' $PATH)
  set -eg PATH[$index]; end; set -e index
  set -gx PATH '/Users/shub/.pyenv/shims' $PATH
  pyenv init - | source
  command pyenv rehash 2>/dev/null
  # Created by `pipx` on 2023-04-29 10:26:20
  set PATH $PATH /Users/shub/.local/bin
  pyenv init - | source
  status --is-interactive; and pyenv virtualenv-init - | source
end

# pnpm
set -gx PNPM_HOME "/Users/shub/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

set PYENV_VIRTUALENV (pyenv root)/plugins/pyenv-virtualenv
#######
# test if pyenv-virtualenv is cloned into default directory.
#######
if test -d $PYENV_VIRTUALENV
  and type -q pyenv
  status --is-interactive; and pyenv virtualenv-init - | source
end
