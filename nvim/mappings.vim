"map <leader>f :RnvimrToggle<CR>

" ----- 'liuchengxu/vim-wich-key' -----
"nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '\'<CR>
"vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '\'<CR>

"nmap <Leader>a :A<CR> " Alternate source/header files

"nmap <Leader>z :TagbarToggle<CR>

" Disable highlight search
nmap <Leader>l :nohlsearch<CR>

" Buffer navigation
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>
" noremap <C-k>     :bnext<CR>
" inoremap <C-k>     <Esc>:bnext<CR>
" noremap <C-j>     :bprev<CR>
" inoremap <C-j>     <Esc>:bprev<CR>

"nnoremap <Leader>q :bd<CR>

"inoremap <Leader>q <Esc>:bd<CR>
" nnoremap <Leader>b :Buffers<CR>

" Windows navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Window resizing
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Search pattern in files
":nnoremap <Leader>e :Ag -G '.*\.(h\|cc)'<Space>
":nnoremap <expr><Leader>E ":Ag -G '.*\.(h\|cc)' " .expand("<cword>")
" nnoremap <Leader>F :Files<CR>
 nnoremap <expr><Leader>e ":Rg " .expand("<cword>")
 nnoremap <expr><Leader>E ":Lines " .expand("<cword>")
" nnoremap <expr><Leader>E ":BLines " .expand("<cword>")

" Open the file under cursor with fzf
nnoremap <expr>gc ":FZF -q " .expand("<cfile>")

" Substitute word under cursor
nnoremap <Leader>ss :%s/<C-r><C-w>/<C-r><C-w>/gc<Left><Left><Left>
" Substitute word
vnoremap <Leader>ss :s///gc<Left><Left><Left>

" remap <esc> in insert, command and visual modes
"inoremap kj <esc>
"cnoremap kj <esc>
"vnoremap kj <esc>

" Keep it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Add jump > 5 lines to jump list so it can be followed by Ctrl-O and Ctrl-I
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Keep selection after tabbing
vnoremap < <gv
vnoremap > >gv

nnoremap <Leader>h :sp<BAR>:view /home/vault/customVimKeyBindings<CR>

"map <Leader>y :py3f /home/dot/nvim/clang-format.py<cr>
map <Leader>y :ClangFormat<cr>

" HARDMODE, for educational purpose
" http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
" noremap h <NOP>
" noremap j <NOP>
" noremap k <NOP>
" noremap l <NOP>
