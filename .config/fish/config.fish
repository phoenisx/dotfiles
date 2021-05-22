. ~/.config/fish/git.alias.fish
. ~/.config/fish/docker.alias.fish
. ~/.config/fish/misc.alias.fish

switch (uname)
case Linux
  # Need to change this
  set -g DENO_INSTALL "/Users/shub/.deno"
case Darwin
  set -g DENO_INSTALL "/Users/shub/.deno"
case '*'
  set -g DENO_INSTALL "/Users/shub/.deno"
end

# Theme Settings for OMF
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes

set -gx PATH ~/go/bin/ ~/.cargo/bin (echo "$DENO_INSTALL/bin") /usr/local/bin $PATH
