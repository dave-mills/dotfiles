# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"

# Directories
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"

# Laravel
alias art="php artisan"
alias fresh="php artisan migrate:fresh --seed"
alias seed="php artisan db:seed"
alias ideh="php artisan ide-helper:eloquent && php artisan ide-helper:generate && php artisan ide-helper:meta && php artisan ide-helper:models -n"
alias idehsetup="composer require --dev barryvdh/laravel-ide-helper"

# PHP
alias php73="/usr/local/Cellar/php@7.3/7.3.13/bin/php"
alias php72="/usr/local/Cellar/php@7.2/7.2.26/bin/php"
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias cf="cfresh"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias nf="nfresh"
alias nw="npm run watch"

# Python
alias pip='pip3'
alias python='python3'

# Git
alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
alias gac='git add .; git commit -m'
alias gs='git status'
alias gp='git push'
alias gpp='git fetch && git pull'
alias diff="git diff"
alias glog='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit'
alias nah='git reset --hard && git clean -df'
alias unstage="git restore --staged ."
alias wip="commit wip"
gpnew() {
    git push --set-upstream origin $(git branch --show-current)
}


alias bfg="java -jar /Users/dave/Downloads/bfg-1.13.0.jar "

# GCloud
alias ccb='gcloud config configurations activate stats4sd-old'
alias ccs='gcloud config configurations activate stats4sd'
alias ccp='gcloud config configurations activate default'


# Utility Shortcuts
alias maketar='maketar.sh'

# MySQL
createdb() {
	mysql -u root -proot -e "create database $1"
}


alias phpstorm='storm'
