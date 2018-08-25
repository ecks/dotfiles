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
