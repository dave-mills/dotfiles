###########################
# Shortcuts I use all the time
###########################
# nci = npm install && composer install
# fresh = php artisan migrate:fresh --seed
# ggo = Open the remote of the current Git repo in your browser (e.g. go to Github)
# sgo = Open the current local site in the browser (e.g. http://mysite.test)
# gs = git status
# gac = Add all changes and git commit with a message. Use like `gac "My commit message"`
# rdb = create or recreate a database. Use like
#    `rdb mydatabase` - this will drop the database if it exists, and create a new one.
#    `rdb mydatabase path/to/mydatabase.dump` - this will drop the database if it exists, create a new one, and import the dump file.


###########################
###########################

## open this file in VS Code
alias aliases="code $DOTFILES/aliases.zsh"

## Copy your default ssh key to the clipboard
alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"

## Reload the zsh shell
alias reloadshell="source $HOME/.zshrc"

## Reload the dns cache (I can't remember why I needed this)
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"

## Copy ascii shrug to the clipboard. Critical functionality.
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"

## clear the console even more quickly
alias c="clear"

######################################
# Directories #
alias dotfiles="cd $DOTFILES"
alias library="cd $HOME/Library"
alias sites="cd $HOME/Sites"
alias dumps="cd $DUMPS"


######################################
# Laravel Things

alias art="php artisan"

## Setup shortcuts
alias nci="composer install && npm install"
alias fresh="php artisan migrate:fresh --seed"
alias seed="php artisan db:seed"


### quickly open the current (local) site in the browser
sgo() {
    SITE=${PWD##*/}
    open "http://$SITE.test"
}

### Shortcuts when using barryvdh/laravel-ide-helper
alias idehsetup="composer require --dev barryvdh/laravel-ide-helper"
alias ideh="php artisan ide-helper:eloquent && php artisan ide-helper:generate && php artisan ide-helper:meta && php artisan ide-helper:models -n"

idem() {
    php artisan ide-helper:models -n --dir="${1}"
}

## hard reset of composer dependencies and vendor directory
alias cfresh="rm -rf vendor/ composer.lock && composer i"

## same shortcut but fewer letters...
alias cf="cfresh"

## copy the '--ignore-table' flags when you want to mysqldump a database but ignore the telescope tables (as they may be huge)
ignoretable() {
	echo "--ignore-table=${1}.telescope_entries --ignore-table=${1}.telescope_entries_tags --ignore-table=${1}.telescope_monitoring" | pbcopy
}

# Remote MySQL Dump, with structure but no data from telescope tables
### WIP!
remotedump() {
    REMOTE=$1
    DB=$2
    USER=$3

    if [ -z "$REMOTE" ] || [ -z "$DB" ]
        then
        echo "Usage: remotedump <remote> <database>"
        return 1
    fi

    if [ -z "$USER" ]
        then
        USER="forge"
    fi

    echo "Dumping $DB from $REMOTE"

    ssh $REMOTE "mysqldump -u $USER -p $DB --ignore-table=$DB.telescope_entries --ignore-table=$DB.telescope_entries_tags --ignore-table=$DB.telescope_monitoring" > "$DUMPS/$DB-remote-$REMOTE.sql"

    # Check if the db has a table called "telescope_entries"
    if ssh $REMOTE "mysql -u $USER -p -e 'USE $DB; SHOW TABLES LIKE \"telescope_entries\";'" | grep -q "telescope_entries"; then
        echo "Telescope entries found"
        ssh $REMOTE "mysqldump -u $USER -p --no-data $DB telescope_entries telescope_entries_tags telescope_monitoring" >> "$DUMPS/$DB-remote-$REMOTE.sql"
    else
        echo "No telescope entries found, proceeding with the dump."
    fi

}


#####################################
# Javascript Stuff

## hard reset of node_modules and package-lock.json
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias nf="nfresh"

###################################
# Python
alias pip="pip3"
alias python="python3"
alias venv="source venv/bin/activate"

####################################
# Git Stuff

### Add and commit all changes with a message
alias gac='git add .; git commit -m'


alias ga='git add'
alias gaa='git add .'
alias gc='git commit -m'
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



### Git BFG Repo Cleaner (needs to be downloaded first)
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
    else
        if [ -f $DUMPS/$1.sql ]
            ## otherwise, check if there's a .sql file in the dumps directory to use
            then
            mysql -u root $1 < $DUMPS/$1.sql
        fi

        if [ -f $DUMPS/$1.dump ]
            ## otherwise, check if there's a .dump file in the dumps directory to use
            then
            mysql -u root $1 < $DUMPS/$1.dump
        fi
    fi
}
;
dumpdb() {
    echo "dumping $1 to $DUMPS/$1.sql"
    mysqldump -u root $1 > $DUMPS/$1.sql
}


alias cdb='createdb'
alias rdb='recreatedb'
alias ddb='dumpdb'

storm() {
    open -na "PhpStorm.app" --args "$1"
}


## TMUX

alias lstart='tmux kill-session -t laravel-with-search; $DOTFILES/scripts/laravel-with-search.sh'
alias tlist='tmux list-sessions'
alias tkill='tmux kill-session -t'
alias lstop='tmux kill-session -t laravel; tmux kill-session -t laravel-with-search'

tstart() {
    tmux new-session -As $1
}


### R

alias renv-restore="R -e 'renv::restore()'"
alias renv-update="R -e 'renv::update()'"
alias renv-status="R -e 'renv::status()'"
alias renv-init="R -e 'renv::init()'"
renvinstall() {
    R -e "renv::install('${1}')"
}

alias renv-snapshot='R -e "renv::snapshot()"'
