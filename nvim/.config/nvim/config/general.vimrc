" General
set number
set relativenumber
set lazyredraw " redraw only when we need to. 
set showmatch " highlight matching [{()}]

" Turn Paste on and off
nnoremap <Leader>p :set invpaste paste?<CR>
set pastetoggle=<Leader>p
set showmode

" indentation -- http://vim.wikia.com/wiki/Indenting_source_code
set expandtab " turns tabs into spaces
set shiftwidth=2 " when using << or >> how many spaces will be shifted over
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing

filetype indent on

" Searching
set incsearch " search as characters are entered
set hlsearch " highlight matches

" turn off search highlight
nnoremap <Leader><space> :nohlsearch<CR>

" copy or change search hit --
" http://vim.wikia.com/wiki/Copy_or_change_search_hit
" Make a simple "search" text object.
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
     \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" enable 256 colors in vim
set t_Co=256
syntax on

" CursorLine
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
nnoremap <Leader>H :set cursorline! cursorcolumn!<CR>
