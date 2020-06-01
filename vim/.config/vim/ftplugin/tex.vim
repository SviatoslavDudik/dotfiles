let g:tex_fold_enabled=1  " enables folds by syntax
setlocal foldmethod=syntax
setlocal textwidth=100
setlocal spell
nnoremap <leader>b o\begin{<++>}<CR>\end{<++>}<Esc>k:,+1s/<++>/
