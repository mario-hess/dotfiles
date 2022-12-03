
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'williamboman/nvim-lsp-installer'
  use { 'catppuccin/nvim', as = "catppuccin" } -- Color theme
  use 'hrsh7th/nvim-cmp' -- Autocompletion
  use 'nvim-treesitter/nvim-treesitter' -- Syntax highlighting
  use 'burntsushi/ripgrep'
  use 'sharkdp/fd'
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = {{ 'nvim-lua/plenary.nvim' }}} -- Fuzzy Finder /w Preview
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  use { 'neoclide/coc.nvim', branch = 'release' }
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { "glepnir/dashboard-nvim" }
  use { "ray-x/lsp_signature.nvim" }
  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
  use 'andweeb/presence.nvim'
  use 'preservim/nerdtree'
  end)
