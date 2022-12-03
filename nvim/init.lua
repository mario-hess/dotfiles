
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
            bg = 'none',
        },
        background = {
            bg = 'none',
        },
        tab = {
            bg = 'none',
        },
        separator = {
            bg = 'none',
            fg = 'none',
        },
        separator_selected = {
            bg = '#282a36',
            fg = '#282a36',
        },
        separator_visible = {
            bg = '#282a36',
            fg = '#282a36',
        },
        offset_separator = {
            bg = '#282a36',
            fg = '#282a36'
        },
        close_button = {
            fg = '#ed8796',
        },
        close_button_selected = {
            fg = '#ed8796',
        },
        buffer_selected = { italic = false }
    },
}

local custom_catppuccin = require'lualine.themes.catppuccin'

-- Change the background of lualine_c section for normal mode
custom_catppuccin.normal.c.bg = 'none'

require('lualine').setup{
	options = {
		theme = custom_catppuccin
		-- ... the rest of your lualine config
	}
}

require("telescope").setup{
    defaults = {
      layout_config = { width = 0.99 },
  }
}

require("lsp_signature").setup()

require("presence"):setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = false,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                       -- Show the timer

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})
