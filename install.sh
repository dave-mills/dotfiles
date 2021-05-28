#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew bundle


# Install global Composer packages
/usr/local/bin/composer global require laravel/installer laravel/valet

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the _dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/_dotfiles/.zshrc $HOME/.zshrc

# Symlinks eslint config
rm -rf $HOME/.eslintrc
ln -s $HOME/_dotfiles/.eslintre $HOME/.eslintrc

# Symlink the Mackup config file to the home directory
rm -rf $HOME/.mackup.cfg
ln -s $HOME/_dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
