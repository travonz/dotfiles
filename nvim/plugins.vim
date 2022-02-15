"
" Plugins managed by vim-plug
" https://github.com/junegunn/vim-plug
" Install vim-plug
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin('~/.cache/nvim/plugged')

Plug 'gruvbox-community/gruvbox'

" Install nodejs and yarn
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Clang-format vim integration
Plug 'rhysd/vim-clang-format'

Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/a.vim'
Plug 'majutsushi/tagbar'

" Change to folke/which-key.nvim
Plug 'liuchengxu/vim-which-key'

" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'lilydjwg/colorizer'

" Diplay color of color code
" Install go
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
" Plug 'sheerun/vim-polyglot'

Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
" Dependency for rnvimr: https://github.com/neovim/pynvim
" Anytime you upgrade Neovim, make sure to upgrade pynvim as well:
" pip3 install --upgrade pynvim
" Dependency for rnvimr: pip3 install ueberzug

" Language Server Protocol
Plug 'neovim/nvim-lspconfig'
" This tiny plugin adds vscode-like pictograms to neovim built-in lsp
" Install ttf-nerd-fonts-symbols ???
Plug 'onsails/lspkind-nvim'

" Auto-complete
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lua'
"Plug 'kdheepak/cmp-latex-symbols'

" Snippet
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'nvim-treesitter/playground'

" Plug 'preservim/nerdcommenter' " Comment and uncomment lines TO BE TESTED

" Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

" Startup page
Plug 'mhinz/vim-startify'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

call plug#end()

