source /home/adrian/.config/zsh/z.zsh



autoload -U colors && colors



# git
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
typeset -a precmd_functions
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:*' unstagedstr '%F{196}'
zstyle ':vcs_info:*' stagedstr '%F{208}'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '(%F{046}%c%u%b%f%f) '
zstyle ':vcs_info:git:*' actionformats '(%b|%a)'

export PROMPT='%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) %{$fg[cyan]%}%c%{$reset_color%} ${vcs_info_msg_0_}'

autoload -U compinit && compinit
setopt COMPLETE_IN_WORD
setopt MENU_COMPLETE

alias ls='ls --color=always'
function cd() {
    new_directory="$*";
    if [ $# -eq 0 ]; then 
        new_directory=${HOME};
    fi;
    builtin cd -- "${new_directory}" && ls
}
export XDG_CONFIG_HOME=/home/adrian/.config
export XDG_CACHE_HOME=/home/adrian/.cache
export XDG_DATA_HOME=/home/adrian/.local/share

alias ll='ls -l'
alias la='ls -a'

alias open='xdg-open'

alias pacin='sudo pacman -S'
alias pacup='sudo pacman -Syu'
alias pacrem='sudo pacman -Rs'
alias yayin='yay -S'
alias yayup='yay -Syu'
alias yayrem='yay -Rs'
alias aptin='sudo apt install'
alias aptup='sudo apt update && sudo apt upgrade && sudo apt autoremove'
alias aptrem='sudo apt remove'

alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gr='git restore'
alias gp='git push'
alias gpl='git pull'
alias gbp='git commit -m "add stuff"'

alias act='source env/bin/activate'

alias py='python3'
alias jnb='jupyter notebook'
alias v='nvim'

alias ifimnt='sshfs adriandu@login.ifi.uio.no:. ~/ifimount'
alias ifiunmnt='fusermount -u ~/ifimount'

export EDITOR=/usr/bin/nvim
bindkey -v

# speak "The Durix Operating System" &
