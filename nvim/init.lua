
require("mario.packer")
require("mario.settings")
require("mario.remap")
require("mario.cmp_nvim")
require("mario.dashboard")
require("mario.lsp_nvim")

-- CMP
local cmp = require('cmp')
cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }    
  })
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('mario.cmp_nvim').update_capabilities(capabilities)

-- The following example advertise capabilities to `clangd`.
require'lspconfig'.clangd.setup {
  capabilities = capabilities,
}

-- This shit does not work
require'nvim-web-devicons'.setup{ default = false }

-- Bufferline
require('bufferline').setup{
    highlights = {
        fill = {
            bg = '#282a36'
        },
        buffer_selected = { italic = false }
    },
    options = {
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_instert = true,
        color_icons = true,
  }
}

local custom_catppuccin = require'lualine.themes.catppuccin'

-- Change the background of lualine_c section for normal mode
custom_catppuccin.normal.c.bg = '#282a36'

require('lualine').setup{
	options = {
		theme = custom_catppuccin
		-- ... the rest of your lualine config
	}
}

require("nvim-lsp-installer").setup{}

require("telescope").setup{
    defaults = {
      layout_config = { width = 0.99 },
  }
}

require("lsp_signature").setup()

