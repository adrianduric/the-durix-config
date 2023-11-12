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

### Create zsh directory and move .zshrc

After these steps, move into ~/.config and make a zsh directory (for convenience), and move the .zshrc file there:

```
cd ~/.config
mkdir zsh
mv ~/.zshrc zsh
```

The next time you open a terminal, the .zshrc file should now be read from here.
