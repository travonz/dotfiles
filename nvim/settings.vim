

syntax on
set relativenumber
set number			    " Show line number
set showmatch			" highlight matching brace
set smartcase			" Enable smart-case search
set ignorecase			" Always case-insensitive
set incsearch			" Search for strings incrementally
set hidden			    " Allow hidden buffer
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap

set noswapfile
set nobackup			" Do not make a backup before overwriting a file, recommanded by coc
set nowritebackup       " Recommanded by coc
set undodir=~/.cache/nvim/undodir
set undofile

set colorcolumn=80		" draw a vertical line
set cursorline			" highlight current line

set cmdheight=2			" give more space for displaying message

" set timeoutlen=500	" timeout for key sequence, default is 1000ms
"
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

set shortmess+=c        " Don't pass messages to |ins-completion-menu|.


set scrolloff=8			" minimal number of screen lines above and below the cursor

