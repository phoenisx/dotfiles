# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="random"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
ZSH_THEME_RANDOM_CANDIDATES=( "cobalt2" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  fzf
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

#####################################################################
#
# Aliases for init Setup
#
#####################################################################
alias dcps="docker-compose ps"
alias dcpss="docker-compose ps --services";
alias dimg="docker images"
alias dia="docker images -a"
alias dcup="COMPOSE_HTTP_TIMEOUT=10000 docker-compose up"
alias dcupd="COMPOSE_HTTP_TIMEOUT=10000 docker-compose up -d"
alias dcstp="docker-compose stop"
alias dsta="docker stats --all"
alias dclf="COMPOSE_HTTP_TIMEOUT=10000 docker-compose logs -f";
alias dcltf="COMPOSE_HTTP_TIMEOUT=10000 docker-compose logs --tail=30 -f";
alias dexit="docker exec -it"
alias dcupdate="docker-compose pull && docker-compose build"
alias drst="docker restart"
alias dcrst="docker-compose restart"
alias dcmod="COMPOSE_HTTP_TIMEOUT=10000 docker-compose -f docker-compose.yml -f modportal/docker-compose.yml"

alias dftot="df -ahH --total"

function dbash() {
  docker exec -it $1 /bin/bash;
}

function dtf() {
  $(echo "docker exec -it ${1} tail -f log/development.log");
}

function codelint() {
    if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: \`codelint \${FILE_PATH} \${UPPER_LINENUM_BOUND} \${LOWER_LINENUM_BOUND} [\${LINT_ENGINE}]\`";
    return;
  fi
  x=$(for ii in $(seq $2 $3); do; echo -en "${ii},"; done;)
  linter="";
  if [ -z "$4" ]; then
    linter="";
  else
    linter="-e "$4
  fi
  $(echo -en "codeclimate analyze ${linter} $1 | grep -E \"$x\"");
#  codeclimate analyze -e $1 $2 | grep -E $x;
}

function glcuser() {
  git config --local --add user.name "Shub1427"
  git config --local --add user.email "shub1493biswas@gmail.com"
}


##############################################################################
#
# Environment Variables...
#
##############################################################################

GEM_FILE=${HOME}/.gem
BTT_SRC=${HOME}/src/btt/ehq
SHUB_SRC=${HOME}/Subroto

# Doing Mac OSX Specific Tasks...
if uname | grep -q "Darwin"; then
  . `brew --prefix`/etc/profile.d/z.sh
  export PATH="/usr/local/opt/node@8/bin:$PATH"

  function rstBlu() {
    sudo kextunload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
    sudo kextload -b com.apple.iokit.BroadcomBluetoothHostControllerUSBTransport
  }
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
else
  # Arch Linux Specific Path, for FZF...
  [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
  [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
fi



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
