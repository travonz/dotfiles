" Interesting pointers for neovim config
" -> https://github.com/ThePrimeagen/
" -> https://github.com/ChristianChiarulli

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/mappings.vim

source $HOME/.config/nvim/startify.vim
" session.vim replace by startify
"source $HOME/.config/nvim/session.vim

source $HOME/.config/nvim/nvim-lspconfig.vim
" Replace by nvim-lspconfig
"source $HOME/.config/nvim/coc.vim

source $HOME/.config/nvim/autocomplete.vim

source $HOME/.config/nvim/which-key.vim
source $HOME/.config/nvim/hexokinase.vim
source $HOME/.config/nvim/treesitter.vim

source $HOME/.config/nvim/telescope.vim

source $HOME/.config/nvim/nvim-gdb.vim

" set mouse=a


"let g:netrw_browse_split = 4 " act like "P": Open in previous window
"let g:netrw_browse_split = 0 " Open in the same window
"let g:netrw_banner = 0
"let g:netrw_winsize = 20
let g:netrw_list_hide= '^\.'


" ----- gruvbox-community/gruvbox ------
"let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = '0'
colorscheme gruvbox
set background=dark


" ----- vim-airline settings -----------------
set laststatus=2 " Always show status bar
"let g:airline#extensions#tabline#enabled = 1 " Show airline for tabs too


" ------ norcalli/nvim-colorizer.lua -----
" require 'colorizer'.setup() DOES NO WORK


" ------ lilydjwg/colorizer ------
let g:colorizer_startup = 0


" ------ junegunn/fzf -----
" Start fzf in a popup window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }


" ----- 'kevinhwang91/rnvimr' -----
let g:rnvimr_enable_picker = 1      " Ranger to be hidden after picking a file
let g:rnvimr_draw_border = 1
let g:rnvimr_ranger_cmd = ['ranger', '--cmd=source $HOME/.config/ranger/rc.conf']
let g:rnvimr_presets = [{'width': 0.900, 'height': 0.900}]
let g:rnvimr_action = {
            \ '<Enter>': 'NvimEdit tabedit',
            \ }


" -----  vim-script/a.vim
"let g:alternateExtensions_cc = "h"
"let g:alternateNoDefaultAlternate = 1
"let g:alternateExtensions_h = "cc,cpp,cxx,c,CC"


"  -----  majutsushi/tagbar  ---------------------------------------------
let g:tagbar_autofocus = 1

"  -----  rhysd/vim-clang-format  ---------------------------------------------
"  Look for .clang-format or _clang-format file
let g:clang_format#detect_style_file = 1
" Does nothing if .clang-format file is not found
let g:clang_format#enable_fallback_style = 0


fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

set exrc

