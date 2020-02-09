let g:polyglot_disabled = ['latex'] " disable polyglot plugin
let g:tex_flavor='latex'
let g:vimtex_view_method='mupdf'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

autocmd BufNewFile,BufRead *.tex set spell
