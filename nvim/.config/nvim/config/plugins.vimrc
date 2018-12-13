let s:plugins = filereadable(expand("~/.config/nvim/pack/minpac/opt/minpac/autoload/minpac/impl.vim", 1))

if !s:plugins
  fun! InstallPlugin() " bootstrap plugin
    silent call mkdir(expand("~/.config/nvim/pack/minpac/opt", 1), 'p')
    exe '!git clone git clone https://github.com/k-takata/minpac.git '.expand("~/.config/nvim/pack/minpac/opt/minpac", 1)
  endfun
else
endif

packadd minpac
call minpac#init()
call minpac#add('tpope/vim-unimpaired') " makes switching between tabs easier
call minpac#add('tpope/vim-surround') " cs to change surrounding text
call minpac#add('tpope/vim-commentary') " comment out blocks of text

call minpac#add('dracula/vim') " color scheme

call minpac#add('Shougo/denite.nvim') " fuzzy finder

call minpac#add('vim-airline/vim-airline') " statusline
call minpac#add('vim-airline/vim-airline-themes')

call minpac#add('sjl/gundo.vim') " visualize your vim undo tree

" load all packages
packload

"dein 'tpope/vim-fugitive' " integrate vim with git

"call dein#add('vim-scripts/ReplaceWithRegister') " replace word with register
"call dein#add('majutsushi/tagbar') " use <Leader>tb to look at functions within file
"call dein#add('MarcWeber/vim-addon-mw-utils') " dependancy for vim-snipmate
"call dein#add('tomtom/tlib_vim') " dependancy for vim-snipmate
"call dein#add('garbas/vim-snipmate') " automatic insertion of code blocks by leading keywords
" Optional package exposes the snippets
"call dein#add('honza/vim-snippets') " database of snippets for vim-snipmate

" fills up hdd
" call dein#add 'ludovicchabant/vim-gutentags' " manages ctags files

"call dein#add('Shougo/deoplete.nvim')
"call dein#add('zchee/deoplete-jedi')
"
"call dein#add('neomake/neomake')


" Tagbar
map <Leader>tb :TagbarToggle<CR>
let g:tagbar_autoclose=1

" toggle gundo
nnoremap <Leader>u :GundoToggle<CR>

" Ctags
set tags=./tags;/

" look up docs for unimpaired
map <Leader>uh :help unimpaired<CR>

" Denite
map <Leader>f :Denite file/rec<CR>
map <Leader>b :Denite buffer<CR>

" filter file buffer
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
	     \ ['git', 'ls-files', '-co', '--exclude-standard'])

color dracula

" Use deoplete.
" let g:deoplete#enable_at_startup = 1

" Neomake linter
"autocmd! BufWritePost * Neomake
" let g:neomake_python_enabled_makers = ['flake8']
