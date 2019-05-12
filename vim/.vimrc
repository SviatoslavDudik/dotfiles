let mapleader=","

set runtimepath^=~/.vim/vimrc
set runtimepath^=~/.vim/scripts

runtime airline.vim
runtime deadkeys.vim
runtime latex.vim
runtime maps.vim
runtime markdown.vim
runtime plugins.vim
runtime theme.vim
runtime ulti-snips.vim

syntax on

set showcmd
set relativenumber
set number

set laststatus=2
set visualbell
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

autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
augroup filetypedetect
	" Mail
	autocmd BufRead,BufNewFile *mutt-* setfiletype mail
augroup END

highlight link Jump Function
match Jump '<++>'
