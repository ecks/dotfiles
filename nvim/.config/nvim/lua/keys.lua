require('vimp')

vim.g.mapleader=","

-- Save file
vimp.nnoremap('<Leader>w', ':w<CR>')
-- Reload
vimp.nnoremap('<Leader>r', ':so $MYVIMRC<CR>')
-- buffer
vimp.nnoremap('<Leader>b', ':ls<CR>:b<Space>')

-- turn paste on and off
vimp.nnoremap('<Leader>p', ':set invpaste paste?<CR> set pastetoggle=<Leader>p set showmode')

-- turn off search highlighting
vimp.nnoremap('<Leader><space>', ':nohlsearch<CR>')

vimp.nnoremap('<C-J>', '<C-W><C-J>')
vimp.nnoremap('<C-K>', '<C-W><C-K>')
vimp.nnoremap('<C-L>', '<C-W><C-L>')
vimp.nnoremap('<C-H>', '<C-W><C-H>')

-- run the current line as if it were a command
vimp.nnoremap('<leader>e', ":exe getline(line('.'))<cr>")

-- move vertically by visual line
vimp.nnoremap('j', 'gj')
vimp.nnoremap('k', 'gk')

-- highlight last inserted text
vimp.nnoremap('gV', '`[v`]')

-- toggle netrw in the current buffer
vimp.nnoremap('<Leader>nn', ':Ex<CR>')
vimp.nnoremap('<Leader>nv', ':Vex<CR>')

-- Telescope
vimp.nnoremap('<Leader>ff', ':Telescope find_files<CR>')
vimp.nnoremap('<Leader>fg', ':Telescope git_files<CR>')
vimp.nnoremap('<Leader>fb', ':Telescope buffers<CR>')
vimp.nnoremap('<Leader>g', ':Telescope live_grep<CR>')

local u = require('utils')

u.create_augroup({
    { 'InsertEnter', '*', 'set', 'number', 'norelativenumber'},
    {'InsertLeave', '*', 'set', 'number', 'relativenumber'},
}, 'every')

vim.cmd('hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white')
vim.cmd('hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white')
vimp.nnoremap('<Leader>H', ':set cursorline! cursorcolumn!<CR>')


-- plugins

-- toggle gundo
vimp.nnoremap('<Leader>ud', ':GundoToggle<CR>')

-- look up docs for unimpaired
vimp.nnoremap('<Leader>uh', ':help unimpaired<CR>')
