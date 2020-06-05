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
set shiftwidth=4 " when using << or >> how many spaces will be shifted over
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing

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

" copy or change search hit --
" http://vim.wikia.com/wiki/Copy_or_change_search_hit
" Make a simple "search" text object.
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
     \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" enable 256 colors in vim
set t_Co=256
syntax on

" netrw: https://aonemd.github.io/blog/minimal-vim
"let g:netrw_banner=0
"let g:netrw_browse_split = 4
"let g:netrw_winsize=20
"let g:netrw_liststyle=3
"let g:netrw_localrmdir='rm -r'

"toggle netrw on the left side of the editor
nnoremap <leader>n :Vex<CR>

" CursorLine
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
nnoremap <Leader>H :set cursorline! cursorcolumn!<CR>


let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': '.md'}, {'path':'~/wiki/'}]
