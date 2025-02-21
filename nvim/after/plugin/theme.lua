vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
    color_overrides = {
        all = {
            base = '#282a36',
            mantle ='#282a36',
        }
    },
    transparent_background = true,
})

vim.cmd [[colorscheme catppuccin]]
vim.cmd [[highlight StatusLine guibg=none]]
vim.cmd [[highlight NormalFloat guibg=#2f313d]]
