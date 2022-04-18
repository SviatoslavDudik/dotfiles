set directory=$XDG_DATA_HOME/vim/swap//
if exists('$SUDO_USER')
    " don't create root-owned files
    set nobackup
    set nowritebackup
else
    set backupcopy=yes
    set backupdir=$XDG_DATA_HOME/vim/backup
    set writebackup
endif
if has('persistent_undo')
	set undodir=$XDG_DATA_HOME/vim/undo
	set undofile
endif
if has('viminfo')
	set viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo
endif
if has('mksession')
	set viewdir=$XDG_DATA_HOME/vim/view
	set viewoptions=cursor,folds
endif


if has('cmdline_info')
	" show numbers at the bottom-right in Visual mode
	set showcmd
endif

set number relativenumber
set laststatus=2                       " show statusline
set novisualbell
set hidden                             " allows you to hide buffers even if they have unsaved changes

" set time out on key codes
set notimeout ttimeout ttimeoutlen=200

set cindent                            " auto C indenting
set autoindent                         " maintain indent of current line

set expandtab
set shiftwidth=4
set tabstop=4

set formatoptions+=j                   " join comments smartly
set nojoinspaces                       " don't autoinsert space when joining lines
set textwidth=80                       " hard wrap at 80 columns
set scrolloff=5                        " show 5 lines above and below the cursor

if has('linebreak')
	let &showbreak='⮡ '
endif

if has('folding')
	set fillchars=fold:.
	set foldtext=functions#foldtext()
	set foldmethod=indent
	set foldlevelstart=99
endif

if has('virtualedit')
	set virtualedit=block              " allow cursor to move everywhere in visual block mode
endif

set smartcase                          " use smart case while searching
if has('extra_search')
	set incsearch                      " show search result while typing
	set hlsearch                       " highlight search results
endif

" invisible characters
set list
set listchars=tab:··
set listchars+=trail:•
set listchars+=nbsp:␣

set showmatch                          " briefly jump to the matching paren

if has('syntax')
	set spelllang=en,fr
endif
set complete+=kspell                   " complete with dictionary words

if has('wildmenu')
	set wildmenu                       " use tab menu
set wildmode=longest:full,list,full    " use autocompletion
endif
set path+=**                           " search everywhere

set splitbelow
set splitright
