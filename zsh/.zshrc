#source /etc/profile
source ~/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle tmux
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme ecks/minimal minimal-path-host
antigen apply


if [ -f ~/.hosts ];
then
  source ~/.hosts
fi

if [ -f ~/.alias ];
then
  source ~/.alias
fi

# set term correctly
case "$TERM" in
  rxvt-unicode-256color)
    TERM=rxvt-unicode
    ;;

  screen)
    TERM=rxvt-unicode
    ;;
esac

# set env to include dotfiles dir
export PATH=${PATH}:~/dotfiles

# change directory without "cd" command
setopt auto_cd

alias -s c=vim
alias -s h=vim

export EDITOR=vim
uname=`uname`
if [ $uname = "Linux" ];
then
  alias ls='ls --color=auto'
elif [ $uname = "Darwin" ];
then
  alias ls='ls -G'
  alias vim="/usr/local/bin/vim" # use macvim instead of default vim
fi

alias l='ls'
alias ll='ls -l'
alias la='ls -a'

alias p='pwd'

alias v='vim'

# tmux
alias t='tmux'
alias tn='tmux new -s' # create target session by name
alias ta='tmux attach'
alias tat='tmux attach -t' # tmux attach to target session
alias tl='tmux ls'
alias tr='tmux rename -t'

alias ctgen='ctags -R *'

alias refresh='source ~/.zshrc'

# tab completion
setopt menu_complete

zmodload zsh/complist
autoload -U compinit && compinit
zstyle ':completion:*' menu select

#PROMPT='%1~ %m%# '
