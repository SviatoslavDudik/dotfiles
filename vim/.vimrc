let mapleader=","

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
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'sheerun/vim-polyglot'
Plugin 'instant-markdown.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'lervag/vimtex'
Plugin 'UltiSnips'
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
nnoremap <C-n> :NERDTreeToggle<CR>

function! FixLastSpelling()
	setlocal spell
	normal! mz[s1z=`z
endfunction
map <Space>sp :call FixLastSpelling()<CR>

map <Space>c :w! \| !compiler.sh <c-r>%<CR><CR>
map <Space>p :!openup.sh <c-r>%<CR><CR>
map <Space>r :!clean.sh <c-r>%<CR><CR>

so ~/.vim/latex.vim
so ~/.vim/markdown.vim

autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
augroup filetypedetect
	" Mail
	autocmd BufRead,BufNewFile *mutt-*              setfiletype mail
	augroup END

so ~/.vim/scripts/deadkeys.vim
map <F7> :call ToggleDeadKeys()<CR>

highlight link Jump Function
match Jump '<++>'
noremap <leader><Tab> <Esc>/<++><CR>"_c4l

so ~/.vim/airline.vim

"let g:airline_solarized_bg='dark'
set bg=light
highlight SpellBad ctermfg=White ctermbg=Red
highlight SpellCap cterm=underline ctermfg=LightBlue ctermbg=None

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:UltiSnipsSnippetDirectories=["UltiSnips"]
