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
call minpac#add('morhetz/gruvbox')

"call minpac#add('Shougo/denite.nvim') " fuzzy finder

call minpac#add('vim-airline/vim-airline') " statusline
call minpac#add('vim-airline/vim-airline-themes')

call minpac#add('sjl/gundo.vim') " visualize your vim undo tree

call minpac#add('junegunn/fzf') " fuzzy finding
call minpac#add('junegunn/fzf.vim') " fuzzy finding

call minpac#add('neovim/nvim-lspconfig')
call minpac#add('nvim-lua/completion-nvim')

call minpac#add('nvim-lua/popup.nvim')
call minpac#add('nvim-lua/plenary.nvim')
call minpac#add('nvim-telescope/telescope.nvim')


call minpac#add('nvim-treesitter/nvim-treesitter')
call minpac#add('nvim-treesitter/nvim-treesitter-textobjects')

call minpac#add('vimwiki/vimwiki')
call minpac#add('michal-h21/vim-zettel')

call minpac#add('tpope/vim-vinegar')

call minpac#add('samoshkin/vim-mergetool')

call minpac#add('mattn/vim-goimports')

call minpac#add('tpope/vim-fugitive')
call minpac#add('lewis6991/gitsigns.nvim')
call minpac#add('tjdevries/colorbuddy.nvim')

call minpac#add('moll/vim-bbye')

call minpac#add('easymotion/vim-easymotion')

" load all packages
packload

"call dein#add('vim-scripts/ReplaceWithRegister') " replace word with register
"call dein#add('MarcWeber/vim-addon-mw-utils') " dependancy for vim-snipmate
"call dein#add('tomtom/tlib_vim') " dependancy for vim-snipmate
"call dein#add('garbas/vim-snipmate') " automatic insertion of code blocks by leading keywords
" Optional package exposes the snippets
"call dein#add('honza/vim-snippets') " database of snippets for vim-snipmate

" toggle gundo
nnoremap <Leader>u :GundoToggle<CR>

" look up docs for unimpaired
map <Leader>uh :help unimpaired<CR>

" FZF
"map <Leader>f :Files<CR>
map <Leader>f :Telescope find_files<CR>
"map <Leader>fg :GFiles<CR>
map <Leader>fg :Telescope git_files<CR>
"map <Leader>fb :Buffers<CR>
map <Leader>fb :Telescope buffers<CR>
map <Leader>g :Telescope live_grep<CR>

"color dracula
color gruvbox

" for gitsigns
highlight GitSignsAdd guifg=yellow ctermfg=yellow
highlight GitSignsAdd guibg=black ctermbg=black

highlight GitSignsChange guifg=brown ctermfg=brown
highlight GitSignsChange guibg=black ctermbg=black

highlight GitSignsDelete guifg=red ctermfg=red
highlight GitSignsDelete guibg=black ctermbg=black

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :so $MYVIMRC \| :call minpac#update()<CR>

" dispatch -- parameter to rust's cargo build system
let g:cargo_makeprg_params = 'build'

" Neomake linter
"autocmd! BufWritePost * Neomake
"call neomake#configure#automake('w')

"let g:neomake_python_flake8_maker = { 'args': ['--config=~/.config/flake8/flake8.conf']}
"let g:neomake_python_enabled_makers = ['flake8']


"lua <<EOF
"require'nvim-treesitter.configs'.setup {
"  textobjects = {
"    select = {
"      enable = true,
"      keymaps = {
"        -- You can use the capture groups defined in textobjects.scm
"        ["af"] = "@function.outer",
"        ["if"] = "@function.inner",
"        ["ac"] = "@class.outer",
"        ["ic"] = "@class.inner",
"
"        -- Or you can define your own textobjects like this
"        ["iF"] = {
"          python = "(function_definition) @function",
"          cpp = "(function_definition) @function",
"          c = "(function_definition) @function",
"          java = "(method_declaration) @function",
"        },
"      },
"    },
"  },
"}
"EOF
"
"lua <<EOF
"require'nvim-treesitter.configs'.setup {
"  textobjects = {
"    swap = {
"      enable = true,
"      swap_next = {
"        ["<leader>a"] = "@parameter.inner",
"      },
"      swap_previous = {
"        ["<leader>A"] = "@parameter.inner",
"      },
"    },
"  },
"}
"EOF
"
"lua <<EOF
"require'nvim-treesitter.configs'.setup {
"  textobjects = {
"    move = {
"      enable = true,
"      goto_next_start = {
"        ["]m"] = "@function.outer",
"        ["]]"] = "@class.outer",
"      },
"      goto_next_end = {
"        ["]M"] = "@function.outer",
"        ["]["] = "@class.outer",
"      },
"      goto_previous_start = {
"        ["[m"] = "@function.outer",
"        ["[["] = "@class.outer",
"      },
"      goto_previous_end = {
"        ["[M"] = "@function.outer",
"        ["[]"] = "@class.outer",
"      },
"    },
"  },
"}
"EOF
