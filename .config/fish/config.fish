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
set -gx PATH ~/.rd/bin ~/go/bin/ ~/.cargo/bin (echo "$DENO_INSTALL/bin") /opt/homebrew/bin/ /usr/local/bin $PATH

switch (uname)
case Linux
  # Do nothing for now
  set -gx PATH "$HOME/.local/bin/"  $PATH
case Darwin
 set -gx PATH "$HOME/.local/bin/"  $PATH
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

if test -e /Applications/WebStorm.app/Contents/MacOS
  set -gx PATH "/Applications/WebStorm.app/Contents/MacOS" $PATH
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

if type -q pyenv
  set PYENV_VIRTUALENV (pyenv root)/plugins/pyenv-virtualenv
  #######
  # test if pyenv-virtualenv is cloned into default directory.
  #######
  if test -d $PYENV_VIRTUALENV
    and type -q pyenv
    status --is-interactive; and pyenv virtualenv-init - | source
  end
end

if type -q task
    task --completion fish | source
end

# The following is only for MacOS and only if it has a custom LLVM version installed
# Recommended and needed for llv v21+, if Apple llvm is odlder than 21
# Currently Apple ships with older llvm, with clang 17 support for c++17
# I wanted to use c++23, which is installed using `brew` and setup using the following env variables.
# `brew install llvm` && `brew install `lld`
if type -q brew && test -e "$(brew --prefix llvm)"
   echo "Setting new Path $(brew --prefix llvm)/bin"
   set -gx PATH "$(brew --prefix llvm)/bin" $PATH
   set -gx LDFLAGS "-L$(brew --prefix llvm)/lib"
   set -gx CPPFLAGS "-I$(brew --prefix llvm)/include"
   set -gx CMAKE_PREFIX_PATH "$(brew --prefix llvm)"
end
