# The Durix Config

My personal Linux setup files.

The setup includes all relevant files and directories in the ~/.config directory for configuration of various utilities.

Thanks to [@jonatan-hanssen](https://github.com/jonatan-hanssen) for helping set up this config.

## Instructions

### Preliminaries

This setup is made for `zsh`. Assuming you are using a fresh install of some Linux distro with `bash` as current shell, we install and change to `zsh`:

For distros with `apt` (for other distros, simply install `zsh`correspondingly):
    
    sudo apt update && sudo apt upgrade

    sudo apt install zsh

    chsh -s $(which zsh)

### Setting up .config and .ssh files

Assuming that `the-durix-config` is placed in the home directory. Simply copy all files and subdirectories in this repo to the corresponding directories in the home directory (`~`).

If `.config` is not already created:

    mkdir ~/.config

From your home directory, copy all files and subdirectories to their corresponding directories:

    cp -r ~/the-durix-config/.config/* ~/.config
    
    cp -r ~/the-durix-config/.ssh/* ~/.ssh
    
    cp ~/the-durix-config/.zshenv ~

### Setting up Neovim with utilities

To use Neovim with the goodies written in the .config directory, we need to install `Neovim`, `[vim-plug](https://github.com/junegunn/vim-plug)`, `Node.js` and `npm`.

To install all except `vim-plug`:

    sudo apt install neovim nodejs npm

To install `vim-plug`, follow its [installation guide](https://github.com/junegunn/vim-plug).
