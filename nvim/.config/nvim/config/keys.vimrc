lua <<EOF

local g = vim.g

g.mapleader=","

local mapper = function(mode, key, result, opts)
  vim.fn.nvim_set_keymap(
    mode,
    key,
    result,
    {
      noremap = true,
      silent = opts.silent or false,
      expr = opts.expr or false,
      script = opts.script or false
    }
  )
end

-- Save file
mapper("n", "<Leader>w", ":w<CR>", {})


-- Quit buffer, preserving windows
mapper("n", "<Leader>q", ":Bdelete<CR>", {})

-- Reload
mapper("n", "<Leader>r", ":so $MYVIMRC<CR>", {})
 
-- buffer
mapper("n", "<Leader>b", ":ls<CR>:b<Space>", {})

-- run the current line as if it were a command
mapper("n", "<Leader>e", ":exe getline(line('.'))<CR>", {})

-- move vertically by visual line
mapper("n", "j", "gj", {})
mapper("n", "k", "gk", {})

-- highlight last inserted text
mapper("n", "gV", "`[v`]", {})

-- toggle netrw in the current buffer
mapper("n", "<Leader>nn", ":Ex<CR>", {})
mapper("n", "<Leader>nv", ":Vex<CR>", {})

mapper("n", "<Leader>yy", ":let @\" = expand('%:t:r')<CR>", {})
EOF

"let mapleader=","

" Save file
" nnoremap <Leader>w :w<CR>



" Reload
" nnoremap <Leader>r :so $MYVIMRC<CR>
 
" buffer
" nnoremap <Leader>b :ls<CR>:b<Space>

"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" run the current line as if it were a command
"nnoremap <leader>e :exe getline(line('.'))<cr>

" move vertically by visual line
""nnoremap j gj
""nnoremap k gk

" highlight last inserted text
"nnoremap gV `[v`]

"toggle netrw in the current buffer
"nnoremap <leader>nn :Ex<CR>
"nnoremap <leader>nv :Vex<CR>

" set norelative when in insert mode
"augroup every
"  autocmd!
"  au InsertEnter * set number norelativenumber
"  au InsertLeave * set number relativenumber
"augroup END
