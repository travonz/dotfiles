"set completeopt=menu,menuone,noselect
"let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua << EOF

local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
view = {
entries = "custom" -- can be "custom", "wildmenu" or "native"
},

 formatting = {
     format = lspkind.cmp_format({
--     mode = "symbol", -- show only symbol annotations
     maxwidth = 50, -- prevent the popup from showing more than provided characters
     menu = ({
     buffer = "[Buffer]",
     nvim_lsp = "[LSP]",
     luasnip = "[LuaSnip]",
     nvim_lua = "[Lua]",
     latex_symbols = "[Latex]",
     }),
 }),
 },

snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },

mapping = {
-- Default mapping to scroll up and down: <C-p> and <C-n>
--      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
--      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
--      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-[>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },

  sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'nvim_lua' },
  { name = 'vsnip' },
  }, {
  { name = 'buffer' },
  }, {
  { name = 'path' }
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
        }
    })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
    { name = 'path' }
    }, {
    { name = 'cmdline' }
    })
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- The following example advertise capabilities to `clangd`.
require'lspconfig'.clangd.setup {
    capabilities = capabilities,
    }

--use({
--  "hrsh7th/nvim-cmp",
--  requires = {
--    { "kdheepak/cmp-latex-symbols" },
--  },
--  sources = {
--    { name = "latex_symbols" },
--  },
--})

EOF

