map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <Space>sp :call FixLastSpelling()<CR>
map <Space>c :w! \| !compiler.sh <c-r>%<CR><CR>
map <Space>p :!openup.sh <c-r>%<CR><CR>
map <Space>r :!clean.sh <c-r>%<CR><CR>
map <F7> :call ToggleDeadKeys()<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
noremap <leader><Tab> <Esc>/<++><CR>"_c4l
