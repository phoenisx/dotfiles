# Sudo Commands
alias dcstrt="systemctl start docker"
alias dcstat="systemctl status docker"
alias dcstop="systemctl stop docker"

alias dcps="docker-compose ps"
alias dcpss="docker-compose ps --services";
alias dimg="docker images"
alias dia="docker images -a"
alias dcup="set -lx COMPOSE_HTTP_TIMEOUT 10000; docker-compose up"
alias dcupd="set -lx COMPOSE_HTTP_TIMEOUT 10000; docker-compose up -d"
alias dcstp="docker-compose stop"
alias dsta="docker stats --all"
alias dclf="set -lx COMPOSE_HTTP_TIMEOUT 10000; docker-compose logs -f";
alias dcltf="set -lx COMPOSE_HTTP_TIMEOUT 10000; docker-compose logs --tail=30 -f";
alias dexit="docker exec -it"
alias dcupdate="docker-compose pull && docker-compose build"
alias drst="docker restart"
alias dcrst="docker-compose restart"
alias dcmod="set -lx COMPOSE_HTTP_TIMEOUT=10000; docker-compose -f docker-compose.yml -f modportal/docker-compose.yml"

####################################
#
# Functions
#
####################################

function dbash -d 'docker exec, get into interactive shell into docker bash'
  docker exec -it $1 /bin/bash
end

function dtf -d 'docker tail development logs from containers'
  echo (docker exec -it $argv[1] tail -f "log/development.log")
end
