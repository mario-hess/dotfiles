
require("mario.packer")
require("mario.settings")
require("mario.remap")
require("mario.cmp_nvim")
require("mario.lsp_nvim")

-- CMP
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
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

require'nvim-web-devicons'.setup{ default = false }

local custom_catppuccin = require'lualine.themes.catppuccin'

-- Change the background of lualine_c section for normal mode
custom_catppuccin.normal.c.bg = 'none'

require('lualine').setup{
	options = {
		theme = custom_catppuccin
	}
}

require("telescope").setup{
    defaults = {
      layout_config = { width = 0.99 },
  }
}

vim.opt.shortmess:append("I")

vim.opt.termguicolors = true
require("bufferline").setup{
  options = {
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_instert = true,
    color_icons = true,
    buffer_close_icon = '',
    show_close_icon = false,
    indicator = {
      icon = '▎',
      style = 'none',
    },
    separator_style = { ' ', ' ' },
    hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
    },
},
highlights = {
  fill = {
    bg = '#282a36',
},
background = {
    bg = '#282a36',
},
tab = {
    bg = '#282a36',
},
tab_selected = {
    bg = '#282a36',
},
tab_separator =  {
  bg = '#282a36',
},
tab_separator_selected = {
  bg = '#282a36',
},
tab_close = {
    bg = '#282a36',
},
close_button = {
    fg = '#ed8796',
    bg = '#282a36',
},
close_button_visible = {
    fg = '#ed8796',
    bg = '#282a36',
},
close_button_selected = {
    fg = '#ed8796',
    bg = '#282a36',
},
buffer_visible = {
    bg = '#282a36',
},
buffer_selected = {
    bg = '#282a36',
    bold = true,
    italic = false,
},
numbers = {
    bg = '#282a36',
},
numbers_visible = {
    bg = '#282a36',
},
numbers_selected = {
    bg = '#282a36',
    bold = true,
    italic = false,
},
diagnostic = {
    bg = '#282a36',
},
diagnostic_visible = {
    bg = '#282a36',
},
diagnostic_selected = {
    bg = '#282a36',
    bold = true,
    italic = false,
},
hint = {
    bg = '#282a36',
},
hint_visible = {
    bg = '#282a36',
},
hint_selected = {
    bg = '#282a36',
    bold = true,
    italic = false,
},
hint_diagnostic = {
    bg = '#282a36',
},
hint_diagnostic_visible = {
    bg = '#282a36',
},
hint_diagnostic_selected = {
    bg = '#282a36',
    bold = true,
    italic = false,
},
info = {
    bg = '#282a36',
},
info_visible = {
    bg = '#282a36',
},
info_selected = {
    bg = '#282a36',
    bold = true,
    italic = true,
},
info_diagnostic = {
    bg = '#282a36',
},
info_diagnostic_visible = {
    bg = '#282a36',
},
info_diagnostic_selected = {
    bg = '#282a36',
    bold = true,
    italic = true,
},
warning = {
    bg = '#282a36',
},
warning_visible = {
    bg = '#282a36',
},
warning_selected = {
    bg = '#282a36',
    bold = true,
    italic = true,
},
warning_diagnostic = {
    bg = '#282a36',
},
warning_diagnostic_visible = {
    bg = '#282a36',
},
warning_diagnostic_selected = {
    bg = '#282a36',
    bold = true,
    italic = true,
},
error = {
    bg = '#282a36',
},
error_visible = {
    bg = '#282a36',
},
error_selected = {
    bg = '#282a36',
    bold = true,
    italic = true,
},
error_diagnostic = {
    bg = '#282a36',
},
error_diagnostic_visible = {
    bg = '#282a36',
},
error_diagnostic_selected = {
    bg = '#282a36',
    bold = true,
    italic = true,
},
modified = {
    bg = '#282a36',
},
modified_visible = {
    bg = '#282a36',
},
modified_selected = {
    bg = '#282a36',
},
duplicate_selected = {
    bg = '#282a36',
    italic = true,
},
duplicate_visible = {
    bg = '#282a36',
    italic = true,
},
duplicate = {
    bg = '#282a36',
    italic = true,
},
separator_selected = {
    bg = '#282a36',
},
separator_visible = {
    bg = '#282a36',
},
separator = {
    bg = '#282a36',
},
indicator_visible = {
    bg = '#282a36',
},
indicator_selected = {
    bg = '#282a36',
},
pick_selected = {
    bg = '#282a36',
    bold = true,
    italic = true,
},
pick_visible = {
    bg = '#282a36',
    bold = true,
    italic = true,
},
pick = {
    bg = '#282a36',
    bold = true,
    italic = true,
},
offset_separator = {
    bg = '#282a36',
},
trunc_marker = {
    bg = '#282a36',
}
}
}

local ok, godot = pcall(require, "godot")
if ok then
  godot.setup({
    -- Adjust the path to your Godot executable
    bin = "godot",
    -- Other configuration options...
  })

  -- Key mappings
  vim.keymap.set("n", "<leader>dr", godot.debugger.debug)
  vim.keymap.set("n", "<leader>dd", godot.debugger.debug_at_cursor)
  vim.keymap.set("n", "<leader>dq", godot.debugger.quit)
  vim.keymap.set("n", "<leader>dc", godot.debugger.continue)
  vim.keymap.set("n", "<leader>ds", godot.debugger.step)
end


vim.keymap.set('n', '<leader>g', ":HopWord<CR>")
vim.keymap.set('n', '<leader>f', ":HopChar1<CR>")
vim.keymap.set('n', '<leader>;', function() require("duck").hatch("🦀", 5)end, {})
vim.keymap.set('n', '<leader>t', ":NERDTreeToggle<CR><CR>")
vim.keymap.set('n', '<leader>s', ":NERDTreeFind<CR>")
vim.o.keywordprg = ':help'
