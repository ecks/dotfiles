source $HOME/.config/nvim/config/keys.vimrc " load keys first in order to define Leader
source $HOME/.config/nvim/config/general.vimrc
source $HOME/.config/nvim/config/line.vimrc " load before plugins for airline to work properly
source $HOME/.config/nvim/config/plugins.vimrc
