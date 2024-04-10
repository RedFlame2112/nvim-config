--local highlight = as.highlight

local GPT_WELCOME_MESSAGE = [[
                                       _____
                                      /   __)\   
                                      |  /  \ \
                                   ___|  |__/ /
                                  / (_    _)_/   Ask and you shall receive
                                 / /  |  |       
                                 \ \__/  | 
                                  \(_____/    
                               
]]




return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    config = require('lualine-conf'),
    event = 'BufEnter',
  },
  
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
  },

  {
    'kyazdani42/nvim-web-devicons',
    lazy = true,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
      require('nvim-treesitter.configs').setup(require('treesitter-conf'))
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
  
  {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    event = 'BufEnter',
    config = function()
      require("ibl").setup(require('indent'))
    end,
  },
  
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'doom',
        config = {
          header = {
             '                                       ',
             '                                       ',
             '                           ▓▓▓▓▓▓▓     ',
             '                       ▓▓▓▓▓▓▓▓▓▓▓▓▓▓  ',
             '                     ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓',
             '                   ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓',
             '  ▓▓             ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓',
             '▓▓▓▓▓▓▓        ▓▓▓▓▓▓▓▓▓▓▓▓▓ ▒▓▓▓▓▓▓▓▓▓',
             '▓▓▓▓▓▓▓▓▓▓   ▓▓▓▓▓▓▓▓▓▓▓▓    ░▓▓▓▓▓▓▓▓▓',
             '  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      ░▓▓▓▓▓▓▓▓▓',
             '    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓         ▓▓▓▓▓▓▓▓▓▓',
             '      ▓▓▓▓▓▓▓▓▓▓▓▓           ▓▓▓▓▓▓▓▓▓▓',
             '    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓         ▓▓▓▓▓▓▓▓▓▓',
             '  ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓      ▒▓▓▓▓▓▓▓▓▓',
             '▓▓▓▓▓▓▓▓▓▓   ▓▓▓▓▓▓▓▓▓▓▓▓    ▒▓▓▓▓▓▓▓▓▓',
             '▓▓▓▓▓▓▓        ▓▓▓▓▓▓▓▓▓▓▓▓▓ ▒▓▓▓▓▓▓▓▓▓',
             '  ▓▓             ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓',
             '                   ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓',
             '                     ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓',
             '                        ▓▓▓▓▓▓▓▓▓▓▓▓▓  ',
             '                          ▓▓▓▓▓▓▓      ',
             '                                       ',
             '                                       ',
          },
          center = {
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'File Browser',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Search Text',
              group = 'Label',
              action = 'Telescope live_grep',
              key = 'a',
            },
          },
          footer = {
            '                                             ',
            '             Nvim now with VSCode            ',
            '                  Support! 🔥                '
          },
          week_header = {
           enable = false,
          },
        },
      }
    end,
    dependencies = {'nvim-tree/nvim-web-devicons'},
    lazy = true,
  },

  -- productivity
  {
    'akinsho/nvim-toggleterm.lua',
    config = function()
      require('toggleterm').setup(require('term'))
    end,
    lazy = true,
    keys = '<C-t>',
  },
  
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    lazy = true,
    event = 'BufEnter',
    config = function ()
      require('bufferline').setup(require('bufferline-conf'))
    end,
  },

  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons',
    },
    lazy = true,
    config = function()
      require('nvim-tree').setup(require('explorer'))
    end,
    cmd = 'NvimTreeToggle',
  },

  {
    'nvim-telescope/telescope.nvim', version = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = false,
  }, 
 
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
  },
  
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
    config = require('cmp-conf'),
  },
  
  {
    'neovim/nvim-lspconfig',
    lazy = true,               
    config = require('ls'),
    depedencies = {
      {
        'onsails/lspkind.nvim',
        name = 'lspkind',
      },
    },
    ft = {'html', 'rust', 'javascript', 'javascriptreact', 'python', 'typescript', 'typescriptreact', 'c', 'cpp', 'go', 'html', 'css' },
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
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end,
    lazy = true,
  },
 
  -- git stuff
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup(require('git'))
    end,
    lazy = true,
    event = 'BufEnter',
  },
  -- latex
  {
    'lervag/vimtex',
  },
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy=false,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function() 
      require("luasnip.loaders.from_vscode").lazy_load() 
      require("luasnip.loaders.from_vscode").lazy_load({ 
        paths = { "~/.config/nvim/snippets/*" } 
      })
    end
  },
  {
    'saadparwaiz1/cmp_luasnip'
  },
  {
  	"epwalsh/obsidian.nvim",
  	version = "*",  -- recommended, use latest release instead of latest commit
  	lazy = true,
  	ft = "markdown",
  	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  	-- event = {
  	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  	--   "BufReadPre path/to/my-vault/**.md",
  	--   "BufNewFile path/to/my-vault/**.md",
  	-- },
  	dependencies = {
    	-- Required.
    	"nvim-lua/plenary.nvim",
  
    	-- see below for full list of optional dependencies 👇
  	},
  	config = function()
    	require('obsidian').setup(require('obsidian-conf'))
  	end
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    opts = {
      ensure_installed = {}, -- not an option from mason.nvim
      ui = {
        icons = {
          package_pending = " ",
          package_installed = "󰄳 ",
          package_uninstalled = " 󰚌",
        },
      },
      max_concurrent_installers = 10,
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require "mason-registry"
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger {
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          }
        end, 100)
      end)
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
  {
    'rcarriga/nvim-notify',
    event = 'VeryLazy',
    config = function()
      require('nvim-notify')
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = require('noice_setup')
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- required by telescope
        "MunifTanjim/nui.nvim",

        -- optional
        "nvim-treesitter/nvim-treesitter",
        "rcarriga/nvim-notify",
        "nvim-tree/nvim-web-devicons",
    },
    opts = require('leetcode-opts')
  },
  { 
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require('trouble-opts')
  },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
        })
    end
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup({
          api_key_cmd = "echo $OPENAI_API_KEY",
          edit_with_instructions = {
          toggle_diff = "<C-d>"
        },
        chat = {
          welcome_message = GPT_WELCOME_MESSAGE,
        },
        keymaps = {
          close = "<C-c>",
          yank_last = "<C-y>",
          yank_last_code = "<C-k>",
          scroll_up = "<C-u>",
          scroll_down = "<C-d>",
          new_session = "<C-n>",
          cycle_windows = "<Tab>",
          cycle_modes = "<C-f>",
          next_message = "<C-j>",
          prev_message = "<C-k>",
          select_session = "<Space>",
          rename_session = "r",
          delete_session = "d",
          draft_message = "<C-r>",
          edit_message = "e",
          delete_message = "d",
          toggle_settings = "<C-o>",
          toggle_sessions = "<C-p>",
          toggle_help = "<C-h>",
          toggle_message_role = "<C-r>",
          toggle_system_role_open = "<C-s>",
          stop_generating = "<C-x>",
        },
      })
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
        "nvim-telescope/telescope.nvim"
    }
  },
}
