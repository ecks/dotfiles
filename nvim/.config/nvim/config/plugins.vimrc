" call InstallPlugin()
try
  packadd minpac
catch
  fun! InstallPlugin() " bootstrap plugin
      exe '!git clone https://github.com/k-takata/minpac.git ' stdpath('config').'/pack/minpac/opt/minpac'
  endfun
endtry

call minpac#init()
call minpac#add('tpope/vim-unimpaired') " makes switching between tabs easier
call minpac#add('tpope/vim-surround') " cs to change surrounding text
call minpac#add('tpope/vim-commentary') " comment out blocks of text

call minpac#add('dracula/vim') " color scheme

call minpac#add('Shougo/denite.nvim') " fuzzy finder

call minpac#add('vim-airline/vim-airline') " statusline
call minpac#add('vim-airline/vim-airline-themes')

call minpac#add('sjl/gundo.vim') " visualize your vim undo tree

call minpac#add('junegunn/fzf') " fuzzy finding
call minpac#add('junegunn/fzf.vim') " fuzzy finding

call minpac#add('tpope/vim-dispatch')
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('neomake/neomake')

call minpac#add('vimwiki/vimwiki')
call minpac#add('michal-h21/vim-zettel')

call minpac#add('tpope/vim-vinegar')

call minpac#add('samoshkin/vim-mergetool')

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


" Tagbar
map <Leader>tb :TagbarToggle<CR>
let g:tagbar_autoclose=1

" toggle gundo
nnoremap <Leader>u :GundoToggle<CR>

" Ctags
set tags=./tags;/

" look up docs for unimpaired
map <Leader>uh :help unimpaired<CR>

" FZF
map <Leader>f :FZF<CR>
"map <Leader>b :Denite buffer<CR>

" filter file buffer
"call denite#custom#alias('source', 'file/rec/git', 'file/rec')
"call denite#custom#var('file/rec/git', 'command',
"	     \ ['git', 'ls-files', '-co', '--exclude-standard'])

color dracula

" dispatch -- parameter to rust's cargo build system
let g:cargo_makeprg_params = 'build'

" Neomake linter
autocmd! BufWritePost * Neomake
call neomake#configure#automake('w')

let g:neomake_python_flake8_maker = { 'args': ['--config=~/.config/flake8/flake8.conf']}
let g:neomake_python_enabled_makers = ['flake8']

let g:c_syntax_for_h=1
let g:neomake_c_enabled_makers=['gcc']
let g:neomake_gcc_args=[
    \ '-fsyntax-only',
    \ '-std=gnu11',
    \ '-Wall',
    \ '-Wextra',
    \ '-fopenmp',
    \ '-I.'
    \ ]

"let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': '.md', 'zettel_template': '~/mytemplate.tpl'}, {'path':'~/wiki/'}]
let g:vimwiki_list = [{'path': '~/wiki/'}]
let g:zettel_format = "%Y-%m-%d-%H%M-%title"
let g:zettel_options = [{"template" :  "~/wiki/mytemplate.tpl"}]
