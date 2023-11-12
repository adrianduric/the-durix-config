# the-durix-config

My personal Linux setup files.

The setup includes all relevant files and directories in the ~/.config directory, used to configure zsh and nvim.

## Steps

### Setup .zshenv

To be able to move .zshrc from the home directory into ~/.config, we first need to setup .zshenv to specify where .zshrc should be read from.

To do this, simply create a .zshenv file:

`touch .zshenv`

Then open it with any text editor such as nvim, and add the following line:

`export ZDOTDIR=/home/<USER>/.config/zsh`

### Clone repo from ~/.config

After these steps, move into ~/.config and clone this repo, which will add `zsh` and `nvim` directories. The next time you open a terminal, the .zshrc file should now be read from here.
