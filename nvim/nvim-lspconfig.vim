lua << EOF

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'sumneko_lua', 'texlab', 'bashls', 'pyright', 'clangd' } --, 'tsserver' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

-- In case of trouble uncomment the following line to print debugging information
-- vim.lsp.set_log_level("debug")

EOF

"   PRIMEAGEN CONFIG
"
"   " Do this in lua?? maybe...
"   " vim.o is short for something teej thinks makes sense.
"   set completeopt=menu,menuone,noselect
"   let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
"
"   fun! LspLocationList()
"       " lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
"   endfun
"
"   nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
"   nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
"   nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
"   nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
"   nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
"   nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
"   nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
"   nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
"   nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
"   nnoremap <leader>vll :call LspLocationList()<CR>
"
"   augroup THE_PRIMEAGEN_LSP
"       autocmd!
"       autocmd! BufWrite,BufEnter,InsertLeave * :call LspLocationList()
"   augroup END
"
"   let g:compe = {}
"   let g:compe.enabled = v:true
"   let g:compe.autocomplete = v:true
"   let g:compe.debug = v:false
"   let g:compe.min_length = 1
"   let g:compe.preselect = 'enable'
"   let g:compe.throttle_time = 80
"   let g:compe.source_timeout = 200
"   let g:compe.incomplete_delay = 400
"   let g:compe.max_abbr_width = 100
"   let g:compe.max_kind_width = 100
"   let g:compe.max_menu_width = 100
"   let g:compe.documentation = v:true
"
"   let g:compe.source = {}
"   let g:compe.source.path = v:true
"   let g:compe.source.buffer = v:true
"   let g:compe.source.calc = v:true
"   let g:compe.source.nvim_lsp = v:true
"   let g:compe.source.nvim_lua = v:true
"   let g:compe.source.vsnip = v:true
"   let g:compe.source.ultisnips = v:true
"   let g:compe.source.luasnip = v:true
