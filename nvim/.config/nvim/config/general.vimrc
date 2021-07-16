" General
set number
set relativenumber
set lazyredraw " redraw only when we need to. 
set showmatch " highlight matching [{()}]

" Turn Paste on and off
nnoremap <Leader>p :set invpaste paste?<CR> set pastetoggle=<Leader>p set showmode

" indentation -- http://vim.wikia.com/wiki/Indenting_source_code
set expandtab " turns tabs into spaces
set shiftwidth=2 " when using << or >> how many spaces will be shifted over
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing

set splitbelow
set splitright

" diff settings
set diffopt=vertical

filetype plugin indent on
set nocompatible

" Searching
set incsearch " search as characters are entered
set hlsearch " highlight matches

" turn off search highlight
nnoremap <Leader><space> :nohlsearch<CR>

" enable 256 colors in vim
set t_Co=256
syntax on

" CursorLine
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
nnoremap <Leader>H :set cursorline! cursorcolumn!<CR>

set mouse=a

color gruvbox
