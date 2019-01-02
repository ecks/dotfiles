#source /etc/profile

if [ -f ~/.hosts ];
then
  . ~/.hosts
fi

if [ -f ~/.alias ];
then
  . ~/.alias
fi

if [ -f ~/.functions ];
then
  . ~/.functions
fi

source ~/circadence/functions

source ~/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle tmux
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle autojump

antigen theme dracula/zsh dracula
antigen apply

export ZSH_THEME="dracula"

# set term correctly
case "$TERM" in
  rxvt-unicode-256color)
    TERM=rxvt-unicode
    ;;

  screen)
    TERM=screen-256color
    ;;
  xterm-termite)
    TERM=xterm

#  *)
#    TERM=rxvt-unicode
#    ;;

esac

# set env to include dotfiles dir
export PATH=${PATH}:~/dotfiles

# change directory without "cd" command
setopt auto_cd

# don't share history between different tmux sessions
setopt nosharehistory

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
  alias vim="/usr/local/bin/nvim" # use nvim instead of default vim
fi

alias l='ls'
alias ll='ls -l'
alias la='ls -a'

alias p='pwd'

alias v='nvim'

# set to vim mode
bindkey -v

# tmux
alias tmux='tmux -2' # enable 256 colors
#alias t='tmux'
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

export PATH="$PATH:$HOME/.rvm/bin:$HOME/.local/bin" # Add RVM to PATH for scripting
export GOPATH="/home/hasenov/go" # Add GOPATH
