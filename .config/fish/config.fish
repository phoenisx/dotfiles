. ~/.config/fish/git.alias.fish
. ~/.config/fish/docker.alias.fish
. ~/.config/fish/misc.alias.fish

switch (uname)
case Linux
  # Need to change this
  set -g DENO_INSTALL "/Users/shub/.deno"
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
 set -gx PATH "$HOME/Library/Python/3.10/bin/"  $PATH
case '*'
  # Do nothing for now
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
  command pyenv rehash 2>/dev/null
end
