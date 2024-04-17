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
  { "Bekaboo/dropbar.nvim", event = "UIEnter", opts = {} },
  {
      "rebelot/heirline.nvim",
      optional = true,
      opts = function(_, opts) opts.winbar = nil end,
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
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Configure Neovim',
              group = 'Label',
              action = 'edit ~/.config/nvim/lua/plugins.lua',
              key = 'c',
            },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Open Mason',
              group = 'Label',
              action = 'Mason',
              key = 'm',
            },
            {
              icon = ' ',
              desc = "Open Lazy Profile",
              action = "Lazy profile",
              key = 'l'
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
    ft = {'html', 'rust', 'javascript', 'javascriptreact', 'python', 'typescript', 'typescriptreact', 'c', 'cpp', 'go', 'html', 'css', 'v', 'sv', },
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
  {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    event = 'BufEnter',
    config = function()
      require("ibl").setup(require('indent'))
    end,
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
      local home = vim.fn.expand("$HOME")
      require("chatgpt").setup({
          api_key_cmd = "cat " .. home .. "/gpt.key",
          chat = {
            welcome_message = GPT_WELCOME_MESSAGE,
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
  {
    'gko/vim-coloresque',
  },
  {
    "tomasky/bookmarks.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("bookmarks").setup({
        save_file = vim.fn.expand("$HOME/.local/share/nvim/bookmarks"), -- bookmarks save file path
        keywords = {
          ["@t"] = "✔ ", -- mark annotation startswith @t ,signs this icon as `Todo`
          ["@w"] = "⚠ ", -- mark annotation startswith @w ,signs this icon as `Warn`
          ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
          ["@n"] = "✎ ", -- mark annotation startswith @n ,signs this icon as `Note`
        },
        on_attach = function(buffer)
          local bm = require("bookmarks")
          local map = vim.keymap.set
          map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
          map("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
          map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
          map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
          map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
          map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
        end,
      })

      require("telescope").load_extension("bookmarks")
    end,
  },
  {
    'ibhagwan/fzf-lua',
    keys = { '<C-f>', '<C-g>' },
    config = function()
      local fzf_lua = require('fzf-lua')

      fzf_lua.setup({
        actions = {
          files = {
            ['default'] = fzf_lua.actions.file_edit_or_qf,
            ['ctrl-x'] = fzf_lua.actions.file_split,
            ['ctrl-v'] = fzf_lua.actions.file_vsplit,
          },
        },
        winopts_fn = function()
          local height = 15

          return {
            border = { '—', '—', '—', '', '', '', '', '' },
            row = vim.o.lines - vim.o.cmdheight - 3 - height,
            column = 1,
            height = height,
            width = vim.o.columns + 1,
          }
        end,
      })

      vim.keymap.set('n', '<C-f>', function()
        fzf_lua.files({
          prompt = '> ',
          previewer = false,
          cwd_prompt = false,
          fzf_opts = { ['--info'] = 'inline' },
        })
      end)

      vim.keymap.set('n', '<C-g>', function()
        fzf_lua.live_grep_native({
          prompt = '> ',
          no_header_i = false,
          previewer = false,
         exec_empty_query = true,
          fzf_opts = { ['--info'] = 'inline', ['--nth'] = '2..' },
        })
      end)
    end,
  },
  {
    'ldelossa/nvim-ide',
    config = function()
      local bufferlist      = require('ide.components.bufferlist')
      local explorer        = require('ide.components.explorer')
      local outline         = require('ide.components.outline')
      local callhierarchy   = require('ide.components.callhierarchy')
      local timeline        = require('ide.components.timeline')
      local terminal        = require('ide.components.terminal')
      local terminalbrowser = require('ide.components.terminal.terminalbrowser')
      local changes         = require('ide.components.changes')
      local commits         = require('ide.components.commits')
      local branches        = require('ide.components.branches')
      local bookmarks       = require('ide.components.bookmarks')
    
      require('ide').setup({
        icon_set = 'nerd',
        log_level = 'info',
        cmd = "Workspace",
       -- Explorer = {
       --   keymaps = {
       --     open = "x",
       --   }
       -- },
        panel_groups = {
          explorer = {
            outline.Name,
            bufferlist.Name,
            explorer.Name,
            bookmarks.Name,
            callhierarchy.Name,
            terminalbrowser.Name,
          },
          terminal = { terminal.Name },
          git = { changes.Name, commits.Name, timeline.Name, branches.Name },
        },
        workspaces = {
          -- which panels to open by default, one of: 'left', 'right', 'both', 'none'
          auto_open = "none",
        },
        panels = {
            left = "explorer",
            right = "git"
        },
      })
    end
  },
  {
		'itchyny/calendar.vim',
		cmd = 'Calendar',
    init = function()
			vim.g.calendar_google_calendar = 1
			vim.g.calendar_google_task = 1
			vim.g.calendar_cache_directory = vim.fn.stdpath('data') .. '/calendar'
		end,
	},
  { 
    "folke/neodev.nvim", 
    lazy = true,
    config = function()
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true }
      })
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            }
          }
        }
      })
    end
  },
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
      "nvim-neotest/nvim-nio",
      "nvim-telescope/telescope-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = require('debugger'),
  },
  {
    'folke/zen-mode.nvim',
    opts = require('zen'),
  },
}


