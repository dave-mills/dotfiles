# Load Homebrew
export PATH="/opt/homebrew/bin/brew:$PATH "

# Load Composer tools
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Load Node global installed binaries
export PATH="$HOME/.node/bin:$PATH"

# Use project specific binaries before global ones
export PATH="node_modules/.bin:vendor/bin:$PATH"

# Fuck - autocorrect for frustrated devs.
# eval $(thefuck --alias fk)



## M1 version
#PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
#export PATH="$HOME/_dotfiles/shortcuts:$PATH"
#export PATH="/usr/local/opt/node@12/bin:$PATH"
#export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
#export PATH="~/Library/Python/3.8/bin:$PATH"
#export PATH="$HOME/_dotfiles/shortcuts:$PATH"

## Homebrew on M1
#export HOMEBREW_PREFIX="/opt/homebrew";
#export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
#export HOMEBREW_REPOSITORY="/opt/homebrew";
#export HOMEBREW_SHELLENV_PREFIX="/opt/homebrew";
#export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
#export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
#export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";


export PATH="$PATH:/Users/Admin/Qt5.14.2/5.14.2/clang_64/bin"
