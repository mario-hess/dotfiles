
return require('packer').startup(function(use)
  use 'habamax/vim-godot'
  use 'lommix/godot.nvim'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'mfussenegger/nvim-jdtls'
  use 'nvim-tree/nvim-web-devicons'
  use 'wbthomason/packer.nvim' -- Packer can manage itself
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'williamboman/nvim-lsp-installer'
  use { 'catppuccin/nvim', as = "catppuccin" } -- Color theme
  use 'hrsh7th/nvim-cmp' -- Autocompletion
  use({
    -- cmp LSP completion
    "hrsh7th/cmp-nvim-lsp",
    -- cmp Snippet completion
    "hrsh7th/cmp-vsnip",
    -- cmp Path completion
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    after = { "hrsh7th/nvim-cmp" },
    requires = { "hrsh7th/nvim-cmp" },
  })
  use('hrsh7th/vim-vsnip')
  use("simrat39/rust-tools.nvim")
  use 'nvim-treesitter/nvim-treesitter' -- Syntax highlighting
  use 'burntsushi/ripgrep'
  use 'sharkdp/fd'
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use { "nvim-telescope/telescope.nvim", tag = '0.1.4', requires = {{ 'nvim-lua/plenary.nvim' }} }
  use { 'neoclide/coc.nvim', branch = 'release' }
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
  use 'preservim/nerdtree'
  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'hyper',
        config = {
            header = {},
          week_header = {
           enable = false,
          },
          shortcut = {
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
          },
        },
      }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }

  use 'tamton-aquib/duck.nvim'
  use {
  'phaazon/hop.nvim',
  branch = 'v2',
  config = function()
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  end
  }
  use 'lervag/vimtex'
end)
