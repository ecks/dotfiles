runtime config/keys.vimrc " load keys first in order to define Leader
runtime config/general.vimrc
runtime config/line.vimrc " load before plugins for airline to work properly
runtime config/plugins.vimrc

runtime config/wiki.vimrc
lua require('lsp')
lua require('ts')
