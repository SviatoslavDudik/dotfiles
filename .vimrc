let mapleader=" "

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'surround.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'dbeniamine/cheat.sh-vim'
Plugin 'colorizer'
" Plugin 'instant-markdown.vim'
call vundle#end()            " required
filetype plugin indent on    " required

syntax on

set showcmd
set relativenumber
set number

set laststatus=2
set visualbell
set notimeout ttimeout ttimeoutlen=200
set shiftwidth=4
set tabstop=4
set spelllang=en,fr

set cin
set listchars=tab:··
set list
set showmatch

set splitbelow
set splitright
set wildmode=longest,list,full

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

function! FixLastSpelling()
	setlocal spell
	normal! mz[s1z=`z
endfunction
map <Space>sp :call FixLastSpelling()<CR>

map <Space>c :w! \| !compiler.sh <c-r>%<CR><CR>
map <Space>p :!openup.sh <c-r>%<CR><CR>

autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff

so ~/.vim/scripts/deadkeys.vim
map <F7> :call ToggleDeadKeys()<CR>

function! NewMarkdown()
	r ~/.vim/templates/markdown.md
	normal! ggdd
endfunction
autocmd BufNewFile *.md :call NewMarkdown()
autocmd BufEnter *.md inoremap ,b ****<++><Esc>F*hi
autocmd BufEnter *.md inoremap ,s ~~~~<++><Esc>F~hi
autocmd BufEnter *.md inoremap ,i **<++><Esc>F*i
autocmd BufEnter *.md nnoremap <leader>= 0vg_yo<Esc>pVr=j
autocmd BufEnter *.md nnoremap <leader>- 0vg_yo<Esc>pVr-j
autocmd BufEnter *.md nnoremap <leader># I###<Space><Esc>0j
autocmd BufEnter *.md nnoremap d* F*xf*x
autocmd BufEnter *.md setlocal spell spelllang=en,fr
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePost *.md :!markdown_save.sh %

highlight link Jump Function
match Jump '<++>'
nnoremap <Space><Tab> <Esc>/<++><CR>"_c4l
vnoremap <Space><Tab> <Esc>/<++><CR>"_c4l

"let g:airline_solarized_bg='dark'
set bg=light
highlight SpellBad ctermfg=White ctermbg=Red
highlight SpellCap cterm=underline ctermfg=LightBlue ctermbg=None
