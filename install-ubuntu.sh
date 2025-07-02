#!/bin/sh

echo "Setting up zsh for Ubuntu..."
ZSH=$HOME/.oh-my-zsh
DOTFILES=$HOME/dotfiles

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the _dotfiles
rm -rf $HOME/.zshrc
ln -s $DOTFILES/.zshrc-ubuntu $HOME/.zshrc

# Symlinks eslint config
rm -rf $HOME/.eslintrc
ln -s $DOTFILES/.eslintrc $HOME/.eslintrc