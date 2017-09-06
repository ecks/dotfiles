" General
set number
set relativenumber
set lazyredraw " redraw only when we need to. 
set showmatch " highlight matching [{()}]

let mapleader=","

" Save file
map <Leader>w :w<CR>

" Reload
map <Leader>r :so $MYVIMRC<CR>
 
" Open header file
map <Leader>h :badd %<.h<CR>

" Open C file
map <Leader>c :badd %<.c<CR>

" Split current window
map <Leader>ss :split<CR>

" Split header file
map <Leader>sh :split %<.h<CR>

" Split C file
map <Leader>sc :split %<.c<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" Permanently set statusline
set laststatus=2

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

"Dein Scripts-----------------------------
if &compatible
  set nocompatible 
endif


" Required:
set runtimepath+=~/.config/vim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.config/vim')

" " Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
"dein 'tpope/vim-fugitive' " integrate vim with git
call dein#add('flazz/vim-colorschemes') " different colorschemes
call dein#add('dracula/vim')

" original repos on github
call dein#add('tpope/vim-unimpaired') " makes switching between tabs easier
call dein#add('tpope/vim-surround') " cs to change surrounding text
call dein#add('tpope/vim-commentary') " comment out blocks of text
call dein#add('vim-scripts/ReplaceWithRegister') " replace word with register
call dein#add('majutsushi/tagbar') " use <Leader>tb to look at functions within file
call dein#add('MarcWeber/vim-addon-mw-utils') " dependancy for vim-snipmate
call dein#add('tomtom/tlib_vim') " dependancy for vim-snipmate
call dein#add('garbas/vim-snipmate') " automatic insertion of code blocks by leading keywords
" Optional package exposes the snippets
call dein#add('honza/vim-snippets') " database of snippets for vim-snipmate

" fills up hdd
" call dein#add 'ludovicchabant/vim-gutentags' " manages ctags files

call dein#add('vim-airline/vim-airline') " statusline
call dein#add('vim-airline/vim-airline-themes')

call dein#add('sjl/gundo.vim') " visualize your vim undo tree
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-jedi')

call dein#add('Shougo/denite.nvim')
call dein#add('neomake/neomake')

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='term'

" Tagbar
map <Leader>tb :TagbarToggle<CR>
let g:tagbar_autoclose=1

" toggle gundo
nnoremap <Leader>u :GundoToggle<CR>

" Ctags
set tags=./tags;/

" look up docs for unimpaired
map <Leader>uh :help unimpaired<CR>

" open file buffer
call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.tox/', '*.pyc', 'external/'])
" Denite
map <Leader>f :Denite file_rec<CR>
map <Leader>b :Denite buffer<CR>

" enable 256 colors in vim
set t_Co=256
syntax on
color dracula

" CursorLine
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
nnoremap <Leader>H :set cursorline! cursorcolumn!<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Neomake linter
autocmd! BufWritePost * Neomake
let g:neomake_python_enabled_makers = ['flake8']
