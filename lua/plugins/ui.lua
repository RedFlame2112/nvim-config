return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    config = require('config.plugins.lualine'),
    event = 'BufEnter',
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
  },  
  {
    'akai54/2077.nvim',
    name = '2077',
    lazy = false,
  },
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
      require('nvim-treesitter.configs').setup(require('config.plugins.treesitter'))
    end,
    event = {
      'BufReadPost *.go',
      'BufReadPost *.rs',
      'BufReadPost *.c',
      'BufReadPost *.gcc',
      'BufReadPost *.h',
      'BufReadPost *.ts',
      'BufReadPost *.tsx',
      'BufReadPost *.js',
      'BufReadPost *.html',
      'BufReadPost *.css',
      'BufReadPost *.scss',
      'BufReadPost *.lua',
    },
    lazy = true,
  }, 
  { "Bekaboo/dropbar.nvim", event = "UIEnter", opts = {} },
  {
      "rebelot/heirline.nvim",
      optional = true,
      opts = function(_, opts) opts.winbar = nil end,
  },  
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = require('config.plugins.dashboard'),
    dependencies = {'nvim-tree/nvim-web-devicons'},
    lazy = true,
  },
  -- productivity
  {
    'akinsho/nvim-toggleterm.lua',
    config = function()
      require('toggleterm').setup(require('config.plugins.toggleterm'))
    end,
    lazy = true,
    keys = '<C-t>',
  },
  
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = true,
    event = 'BufEnter',
    config = function ()
      require('bufferline').setup(require('config.plugins.bufferline'))
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    lazy = true,
    config = function()
      require('nvim-tree').setup(require('config.plugins.nvim_tree'))
    end,
    cmd = 'NvimTreeToggle',
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
  }, 
 
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
  },
  
}
