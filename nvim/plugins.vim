"
" Plugins managed by vim-plug
" https://github.com/junegunn/vim-plug
" Install vim-plug
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin('~/.cache/nvim/plugged')

Plug 'gruvbox-community/gruvbox'

" Install nodejs and yarn
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/a.vim'
Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vim-which-key'
" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'lilydjwg/colorizer'

" Install go
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'sheerun/vim-polyglot'

Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
" Dependency for rnvimr: https://github.com/neovim/pynvim
" Anytime you upgrade Neovim, make sure to upgrade pynvim as well:
" pip3 install --upgrade pynvim
" Dependency for rnvimr: pip3 install ueberzug

" Clang-format vim integration
Plug 'rhysd/vim-clang-format'

" Plug 'preservim/nerdcommenter' " Comment and uncomment lines TO BE TESTED

" Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

call plug#end()

