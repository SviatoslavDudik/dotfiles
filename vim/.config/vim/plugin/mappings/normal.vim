nnoremap c* *Ncgn
" folds
nnoremap <tab> za

" rely on xbindkey & xdotool to simulate F6 when C-i is pressed
" this has been done to avoid conflicts with tab
nnoremap <F6> <C-i>

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
nnoremap <leader>n :nohlsearch<CR>
nnoremap <leader>o :only<CR>
nnoremap <leader>p :!~/.local/bin/openup.sh <c-r>%<CR><CR>
nnoremap <leader>r :!~/.local/bin/clean.sh <c-r>%<CR><CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>x :xit<CR>
nnoremap <silent> <leader>zz :call mappings#zap()<CR>
nnoremap <leader><Tab> <Esc>/<++><CR>"_c4l
nnoremap <leader><leader> <C-^>
" other
nnoremap - :15Lexplore<CR>
nnoremap <F7> :call deadkeys#toggle()<CR>
nnoremap <expr> <CR> empty(&buftype)? '@@' : '<CR>'
nnoremap <Up> :cprevious<CR>
nnoremap <Down> :cnext<CR>
nnoremap <Left> :cpfile<CR>
nnoremap <Right> :cnfile<CR>
