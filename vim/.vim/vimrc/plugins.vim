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
