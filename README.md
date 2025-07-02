# ~D Dotfiles

My own version of a [dotfiles](https://dotfiles.github.io/) repo.

Inspired by the blog and video by Dries Vints: https://driesvints.com/blog/getting-started-with-dotfiles

### Setting up Ubuntu

1. Create ssh key(s)
1. Clone this repo to `~/dotfiles`
2. Install zsh:
   - `sudo apt update`
   - `sudo apt install zsh -y`
3. Configure zsh as your default shell

```sh
chsh -s `which zsh`
```

4. Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh#getting-started)
5. Run `./install-ubuntu.sh`


### Setting up your Mac

1. Update macOS to the latest version with the App Store
2. Install Xcode from the App Store, open it and accept the license agreement
3. Install macOS Command Line Tools by running `xcode-select --install`
4. Create ssh keys (I prefer to make new keys for new devices)
5. Clone this repo to `~/Projects/dotfiles`
6. Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh#getting-started)
7. Run `install.sh` to start the installation
8. Restart your computer to finalize the process

Your Mac is now ready to use!

> Note: you can use a different location than `~/Projects/dotfiles` if you want. Just make sure you also update the reference in the [`.zshrc`](./.zshrc) file.

### Notes on .macos settings
Go through the [`.macos`](./.macos) file and adjust the settings to your liking. You can find much more settings at [the original script by Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) and [Kevin Suttle's macOS Defaults project](https://github.com/kevinSuttle/MacOS-Defaults).

### Notes on Brewfile
Check out the [`Brewfile`](./Brewfile) file and adjust the apps you want to install for your machine. Use [their search page](https://caskroom.github.io/search) to check if the app you want to install is available.

### Notes on Aliases
Check out the [`aliases.zsh`](./aliases.zsh) file and add your own aliases. If you need to tweak your `$PATH` check out the [`path.zsh`](./path.zsh) file. These files get loaded in because the `$ZSH_CUSTOM` setting points to the `.dotfiles` directory. You can adjust the [`.zshrc`](./.zshrc) file to your liking to tweak your Oh My Zsh setup. More info about how to customize Oh My Zsh can be found [here](https://github.com/robbyrussell/oh-my-zsh/wiki/Customization).