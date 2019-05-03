function! NewMarkdown()
	r ~/.vim/templates/markdown.md
	normal! ggdd
endfunction
function! SyncMarkdown()
	!markdown_save.sh %
endfunction
autocmd BufNewFile *.md :call NewMarkdown()
autocmd BufEnter *.md inoremap ,b ****<++><Esc>F*hi
autocmd BufEnter *.md inoremap ,s ~~~~<++><Esc>F~hi
autocmd BufEnter *.md inoremap ,i **<++><Esc>F*i
autocmd BufEnter *.md nnoremap <leader>= 0vg_"_yo<Esc>"_pVr=j
autocmd BufEnter *.md nnoremap <leader>- 0vg_"_yo<Esc>"_pVr-j
autocmd BufEnter *.md nnoremap <leader># I###<Space><Esc>0j
autocmd BufEnter *.md nnoremap d* F*xf*x
autocmd BufEnter *.md setlocal spell spelllang=en,fr
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md setlocal textwidth=100

let g:instant_markdown_autostart = 0
map ,md :InstantMarkdownPreview<CR>

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
autocmd BufWritePre * %s/\s\+$//e

