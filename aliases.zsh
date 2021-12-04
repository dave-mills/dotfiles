# Shortcuts
alias aliases="code ~/_dotfiles/aliases.zsh"
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
# alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
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
idem() {
    php artisan ide-helper:models -n --dir="${1}"
}
alias idehsetup="composer require --dev barryvdh/laravel-ide-helper"

# PHP
alias php73="/usr/local/Cellar/php@7.3/7.3.13/bin/php"
alias php72="/usr/local/Cellar/php@7.2/7.2.26/bin/php"
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias cf="cfresh"

ignoretable() {
	echo "--ignore-table=${1}.telescope_entries --ignore-table=${1}.telescope_entries_tags --ignore-table=${1}.telescope_monitoring" | pbcopy
}

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
ggo() {
    REPO=`git remote -v | awk '{print $2}' | head -n 1`

    if [[ "$REPO" == "git@github.com"** ]]
        then
        FIND="git@github.com:"
        REPLACE="https://github.com/"
        REPO="${REPO/$FIND/$REPLACE}"
    fi
    open $REPO
}




alias bfg="java -jar /usr/local/bin/bfg-1.14.0.jar"

# GCloud
alias ccb='gcloud config configurations activate stats4sd-old'
alias ccs='gcloud config configurations activate stats4sd'
alias ccp='gcloud config configurations activate default'


# Utility Shortcuts
alias maketar='maketar.sh'

# MySQL
createdb() {
	mysql -u root -e "create database $1"
}

recreatedb() {
	mysql -u root -e "drop database if exists $1"
	mysql -u root -e "create database $1"

    ## IF there's a 2nd variable, use the filepath to populate the database;
    if [ $# -eq 2 ]
        then
        mysql -u root $1 < $2
    fi
}

alias cdb='createdb'
alias rdb='recreatedb'

alias phpstorm='storm'


# Servers
uploadtrainingdemo() {

	rsync -avIP "${1}" root@139.162.141.131:/var/www/statistics-training.org/_demos/
	ssh root@139.162.141.131 chown www-data:www-data /var/www/statistics-training.org/_demos
}
