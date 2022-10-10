local nnoremap = require("mario.keymap").nnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
nnoremap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>")

nnoremap("<leader>bn", "<cmd>BufferLineCycleNext<CR>")
nnoremap("<leader>bv", "<cmd>BufferLineCyclePrev<CR>")
nnoremap("<leader>bc", "<cmd>bdelete!<CR>")
nnoremap("<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>")
nnoremap("<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>")
nnoremap("<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>")
nnoremap("<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>")
nnoremap("<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>")
nnoremap("<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>")
nnoremap("<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>")
nnoremap("<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>")
nnoremap("<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>")
nnoremap("<leader>$", "<cmd>BufferLineGoToBuffer -1<CR>")

local bufopts = { noremap=true, silent=true, buffer=bufnr }
nnoremap("<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", bufopts)
nnoremap("<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", bufopts)
nnoremap("<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", bufopts)
nnoremap("<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", bufopts)
nnoremap("<leader>jf", "<cmd>lua vim.lsp.buf.format({async = true })<CR>", bufopts)
nnoremap("<leader>jd", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
