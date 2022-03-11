" Map leader to which_key
" nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
" vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Register which key map
call which_key#register('\', "g:which_key_map")

nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '\'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '\'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" Single mappings
let g:which_key_map['*'] = 'Search forward occurences of word under cursor'
let g:which_key_map['#'] = 'Search backward occurences of word under cursor'
let g:which_key_map.f =   ['RnvimrToggle'   , "Ranger" ]
"let g:which_key_map.b =   ['Buffers'   , "Buffers" ]
let g:which_key_map.q =   ['bd'   , "Delete buffer" ]
let g:which_key_map.z =   ['TagbarToggle'   , "Toggle Tagbar" ]
let g:which_key_map.l = 'Disable highlight search'
"let g:which_key_map.F =   ['Files'   , "Find file" ]
"let g:which_key_map.e =   'Find word under cursor in files'
"let g:which_key_map.E =   'Find word under cursor in buffers'
let g:which_key_map['ss'] = 'Substitute word (under cursor if any)'
let g:which_key_map.h =   'View Custom Key Bindings'
let g:which_key_map.p =   {
            \ 'name'    : '+Search in project',
            \ 'r'       : 'CocSearch word under cursor',
            \ 'h'       : 'Print help word under cursor',
            \ }
let g:which_key_map['y'] = 'Format source with clang-format'
