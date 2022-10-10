vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
    color_overrides = {
        all = {
            base = '#282a36',
            mantle = '#282a36'
        }
    }
})

vim.cmd [[colorscheme catppuccin]]
vim.cmd [[highlight StatusLine guibg=#282a36 ]]
