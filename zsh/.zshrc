# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it does not exist or it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install

#source /etc/profile

# tmux
alias tmux='tmux -2' # enable 256 colors

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

if [ -f ~/.hlwm ];
then
  . ~/.hlwm
fi

# set term correctly
case "$TERM" in
  rxvt-unicode-256color)
    TERM=rxvt-unicode
    ;;

#  screen)
#    TERM=screen-256color
#    ;;
  xterm-termite)
    TERM=xterm

#  *)
#    TERM=rxvt-unicode
#    ;;

esac

# set env to include dotfiles dir
export PATH=${PATH}:~/dotfiles

# don't share history between different tmux sessions
setopt nosharehistory

alias -s c=vim
alias -s h=vim

export EDITOR=vim
uname=`uname`
alias ls='ls --color=auto'

alias l='ls'
alias ll='ls -l'
alias la='ls -a'

alias p='pwd'

# set to vim mode
bindkey -v

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

export GOPATH="$HOME/go" # Add GOPATH
export PATH=$PATH:$HOME/bin:$HOME/nvim-build2/bin/:$GOPATH/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
