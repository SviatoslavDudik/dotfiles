nnoremap c* *Ncgn
" folds
nnoremap <s-tab> za
" Fugitive
nnoremap dgh :diffget //2<CR>
nnoremap dgl :diffget //3<CR>
" Splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" leader
nnoremap <leader>sp :call buffer#spelling#fixlast()<CR>
nnoremap <leader>c :w! \| !~/.local/bin/compiler.sh <c-r>%<CR><CR>
nnoremap <leader>p :!~/.local/bin/openup.sh <c-r>%<CR><CR>
nnoremap <leader>r :!~/.local/bin/clean.sh <c-r>%<CR><CR>
nnoremap <leader>w :s/\(<c-r>=expand("<cword>")<cr>\)/
nnoremap <leader>o :only<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>t mm:%s/\s\+$//e<CR>`m
noremap <leader><Tab> <Esc>/<++><CR>"_c4l
" other
nnoremap <C-n> :Explore<CR>
nnoremap <F7> :call deadkeys#toggle()<CR>
nnoremap <Up> :cprevious<CR>
nnoremap <Down> :cnext<CR>
nnoremap <Left> :cpfile<CR>
nnoremap <Right> :cnfile<CR>
