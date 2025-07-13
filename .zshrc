ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/dotfiles
DUMPS=$HOME/Dumps
ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/highlighters
DEFAULT_USER=`whoami`

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line if you want to change the command execution time
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh
source $DOTFILES/aliases.zsh
source $DOTFILES/path.zsh
source $DOTFILES/pythonstuff.zsh


# User configuration
# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Load Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

## VS Code from CLI
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dave/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/dave/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/dave/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/dave/google-cloud-sdk/completion.zsh.inc'; fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:$PATH"
export HOMEBREW_NO_AUTO_UPDATE="1"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
