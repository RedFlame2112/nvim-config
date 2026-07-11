return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
  },
  {
    "sindrets/diffview.nvim",
  },
  {
    "klen/nvim-test",
    config = function()
      require('nvim-test').setup()
    end
  },
  { 
    "rcarriga/nvim-dap-ui", 
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap-python",
      "leoluz/nvim-dap-go",
      "nvim-neotest/nvim-nio",
      "nvim-telescope/telescope-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = require('config.plugins.dap'),
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    dependencies = { "mfussenegger/nvim-dap", "hrsh7th/cmp-nvim-lsp" },
    config = require("config.plugins.java"),
  },
  {
    'folke/zen-mode.nvim',
    opts = require('config.plugins.zen'),
  },
  {
    "folke/which-key.nvim", 
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = require('config.plugins.which_key'),
    config = function(_, opts)
      require('which-key').setup(opts)
    end
  },
  {
    "ThePrimeagen/harpoon",
    --lazy = true,
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = require('config.plugins.harpoon')
  },
  {
    "letieu/harpoon-lualine",
    dependencies = {
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      }
    },
  },
}
