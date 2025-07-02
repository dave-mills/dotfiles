#!/bin/sh

echo "Setting up your Mac..."
ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/Projects/dotfiles

# Check for Homebrew and install if we don't have it
#if test ! $(which brew); then
 # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
# brew bundle

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the _dotfiles
rm -rf $HOME/.zshrc
ln -s $DOTFILES/.zshrc $HOME/.zshrc

# Symlinks eslint config
rm -rf $HOME/.eslintrc
ln -s $DOTFILES/.eslintrc $HOME/.eslintrc

# Symlink the Mackup config file to the home directory
rm -rf $HOME/.mackup.cfg
ln -s $DOTFILES/.mackup.cfg $HOME/.mackup.cfg

# Set macOS preferences
# We will run this last because this will reload the shell
# source .macos


# Install Mac App Store Apps

mas install 1542271266 #  Silicon Info
mas install 497799835 #   Xcode
mas install 1425368544 #  Timery
mas install 1435957248 #  Drafts
mas install 1465439395 #  Dark Noise
mas install 1453273600 #  Data Jar
mas install 1507246666 #  Presentify
mas install 1542143627 #  OmniFocus
mas install 1588708173 #  Elsewhen
mas install 937984704 #   Amphetamine
mas install 1508732804 #  Soulver 3
mas install 1513400665 #  TripMode