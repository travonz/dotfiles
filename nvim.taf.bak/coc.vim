" ----- neoclide/coc.nvim  settings
" use <tab> for trigger completion and navigate to the next complete item
" Coc is disable by default
" autocmd User CocNvimInit CocDisable

let g:coc_global_extensions = [ 'coc-texlab', 'coc-json', 'coc-clangd', 'coc-pyright', 'coc-svg', 'coc-sh', 'coc-tsserver']

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()

"  Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <Leader>rr <Plug>(coc-rename)
nnoremap <Leader>pr :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <Leader>ph :h <C-R>=expand("<cword>")<CR><CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.  autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap CE :CocEnable<CR>
nnoremap CD :CocDisable<CR>

