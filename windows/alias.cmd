:: Help taken from following answers...
:: https://stackoverflow.com/questions/20530996/aliases-in-windows-command-prompt
:: https://superuser.com/questions/247548/doskey-for-compound-command

@echo off

doskey dcps=docker-compose ps

doskey dcpss=docker-compose ps --services

doskey dimg=docker images

doskey dia=docker images -a

doskey dcup=set COMPOSE_HTTP_TIMEOUT=10000 ^& docker-compose up $*

doskey dcupd=set COMPOSE_HTTP_TIMEOUT=10000 ^& docker-compose up -d $*

doskey dcstp=docker-compose stop $*

doskey dsta=docker stats --all

doskey dclf=set COMPOSE_HTTP_TIMEOUT=10000 ^& docker-compose logs -f $*

doskey dcltf=set COMPOSE_HTTP_TIMEOUT=10000 ^& docker-compose logs --tail=30 -f $*

doskey dexit=docker exec -it $*

doskey dcupdate=docker-compose pull ^& docker-compose build

doskey drst=docker restart $*

doskey dcrst=docker-compose restart $*

doskey dbash=docker exec -it $1 /bin/bash


:: Aliases Taken from `oh-my-zsh` repo
:: Aliases
:: (sorted alphabetically)
::

doskey g=git

doskey ga=git add $*
doskey gaa=git add --all
doskey gapa=git add --patch
doskey gau=git add --update
doskey gav=git add --verbose
doskey gap=git apply

doskey gb=git branch $*
doskey gba=git branch -a
doskey gbd=git branch -d
doskey gbD=git branch -D
doskey gbl=git blame -b -w
doskey gbnm=git branch --no-merged
doskey gbr=git branch --remote
doskey gbs=git bisect
doskey gbsb=git bisect bad
doskey gbsg=git bisect good
doskey gbsr=git bisect reset
doskey gbss=git bisect start

doskey gc=git commit -v $*
doskey gca=git commit -v -a $*
doskey gcam=git commit -a -m $1
doskey gcsm=git commit -s -m $1
doskey gcb=git checkout -b
doskey gcf=git config --list
doskey gcl=git clone --recurse-submodules
doskey gclean=git clean -fd
doskey gcm=git checkout master
doskey gcd=git checkout develop
doskey gcmsg=git commit -m $1
doskey gco=git checkout $*
doskey gcount=git shortlog -sn
doskey gcp=git cherry-pick
doskey gcpa=git cherry-pick --abort
doskey gcpc=git cherry-pick --continue
doskey gcs=git commit -S

doskey gd=git diff $*
doskey gdca=git diff --cached $*
doskey gdcw=git diff --cached --word-diff
doskey gdct=git describe --tags `git rev-list --tags --max-count=1`
doskey gds=git diff --staged
doskey gdt=git diff-tree --no-commit-id --name-only -r
doskey gdw=git diff --word-diff

doskey ggpull=git pull origin $1

doskey ggpush=git push origin $1

doskey ghh=git help

doskey gignore=git update-index --assume-unchanged

doskey gl=git pull
doskey glg=git log --stat
doskey glgp=git log --stat -p
doskey glgg=git log --graph
doskey glgga=git log --graph --decorate --all
doskey glgm=git log --graph --max-count=10
doskey glo=git log --oneline --decorate
doskey glol=git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"
doskey glols=git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --stat
doskey glod=git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"
doskey glods=git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short
doskey glola=git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --all
doskey glog=git log --oneline --decorate --graph
doskey gloga=git log --oneline --decorate --graph --all

doskey gm=git merge
doskey gmom=git merge origin/master
doskey gmt=git mergetool --no-prompt
doskey gmtvim=git mergetool --no-prompt --tool=vimdiff
doskey gmum=git merge upstream/master
doskey gma=git merge --abort

doskey gp=git push
doskey gpd=git push --dry-run
doskey gpf=git push --force-with-lease
doskey gpu=git push upstream
doskey gpv=git push -v

doskey gr=git remote
doskey gra=git remote add
doskey grb=git rebase
doskey grba=git rebase --abort
doskey grbc=git rebase --continue
doskey grbd=git rebase develop
doskey grbi=git rebase -i
doskey grbm=git rebase master
doskey grbs=git rebase --skip
doskey grh=git reset
doskey grhh=git reset --hard
doskey grm=git rm
doskey grmc=git rm --cached
doskey grmv=git remote rename
doskey grrm=git remote remove
doskey grset=git remote set-url
doskey gru=git reset --
doskey grup=git remote update
doskey grv=git remote -v

doskey gsb=git status -sb
doskey gsd=git svn dcommit
doskey gsh=git show
doskey gsi=git submodule init
doskey gsps=git show --pretty=short --show-signature
doskey gsr=git svn rebase
doskey gss=git status -s
doskey gst=git status
doskey gsta=git stash save
doskey gstaa=git stash apply
doskey gstc=git stash clear
doskey gstd=git stash drop
doskey gstl=git stash list
doskey gstp=git stash pop
doskey gsts=git stash show --text
doskey gstall=git stash --all
doskey gsu=git submodule update

doskey gts=git tag -s

doskey gunignore=git update-index --no-assume-unchanged
doskey gup=git pull --rebase
doskey gupv=git pull --rebase -v
doskey gupa=git pull --rebase --autostash
doskey gupav=git pull --rebase --autostash -v
doskey glum=git pull upstream master

doskey gwch=git whatchanged -p --abbrev-commit --pretty=medium

:: Listing Aliases, for cmder (ConEmu)
:: Since ls doesn't work on cmd

doskey la=ls -a --color
doskey ll=ls -l --color
doskey lla=ls -la --color
