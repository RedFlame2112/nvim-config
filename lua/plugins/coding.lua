return {
  -- autocomplete/language servers stuff
  {
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = "InsertEnter",
    dependencies = {
      'hrsh7th/cmp-buffer',  
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'uga-rosa/cmp-dictionary',
      'hrsh7th/cmp-nvim-lsp',
      {
        'onsails/lspkind.nvim',
        name = 'lspkind',
      },
    },
    config = require('config.plugins.cmp'),
  },
  {
    'neovim/nvim-lspconfig',
    lazy = true,               
    config = require('config.lsp'),
    dependencies = {
      {
        'onsails/lspkind.nvim',
        name = 'lspkind',
      },
    },
    ft = {'html', 'rust', 'javascript', 'javascriptreact', 'json', 'lua', 'python', 'typescript', 'typescriptreact', 'c', 'cpp', 'go', 'css', 'v', 'sv', },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },
  },
  {
    'ray-x/go.nvim',
    lazy = true,
    config = function()
      require('go').setup({
        icons = { breakpoint = '', currentpos = '' }
      })
    end,
    event = 'BufReadPost *.go',
    dependencies = {
      'ray-x/guihua.lua',
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
    },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    event = 'BufEnter',
    config = function()
      require("ibl").setup(require('config.plugins.indent'))
    end,
  },
  -- git stuff
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup(require('config.plugins.gitsigns'))
    end,
    lazy = true,
    event = 'BufEnter',
  },
}
