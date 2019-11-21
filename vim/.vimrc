let mapleader=","

set runtimepath^=~/.vim/vimrc
set runtimepath^=~/.vim/scripts

runtime airline.vim
runtime deadkeys.vim
runtime latex.vim
runtime maps.vim
runtime markdown.vim
runtime plugins.vim
runtime spell.vim
runtime ulti-snips.vim

packadd! onedark.vim

syntax on

set showcmd
set relativenumber
set number

set laststatus=2
set novisualbell
set notimeout ttimeout ttimeoutlen=200
set shiftwidth=4
set tabstop=4

set cin
set listchars=tab:··
set list
set showmatch

set splitbelow
set splitright
set wildmode=longest,list,full
"set termguicolors

autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
augroup filetypedetect
	" Mail
	autocmd BufRead,BufNewFile *mutt-* setfiletype mail
augroup END

autocmd BufRead,BufNewFile *.tex set tw=100

highlight link Jump Function
match Jump '<++>'

let g:syntastic_ignore_files = ['\m.py']

let ale#statusline#Count = 1
let g:airline_solarized_bg='dark'
highlight SpellBad ctermfg=White ctermbg=LightRed
highlight SpellCap cterm=underline ctermfg=LightBlue ctermbg=None

"colorscheme gruvbox
colorscheme onedark
set background=dark
