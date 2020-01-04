let mapleader=","

" Save file
nnoremap <Leader>w :w<CR>



" Reload
nnoremap <Leader>r :so $MYVIMRC<CR>
 
" Split current window
nnoremap <Leader>ss :split<CR>
nnoremap <Leader>sv :vsplit<CR>

" buffer,
nnoremap <Leader>b :ls<CR>:b<Space>

"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

" delete text, without saving cut text to register
nnoremap s "_d

" run the current line as if it were a command
nnoremap <leader>e :exe getline(line('.'))<cr>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" set norelative when in insert mode
"augroup every
"  autocmd!
"  au InsertEnter * set number norelativenumber
"  au InsertLeave * set number relativenumber
"augroup END
