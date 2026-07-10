return {
  -- latex
  {
    'lervag/vimtex',
  },
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy=true,
  },
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      
      -- get from friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- also get from ~/.config/nvim/snippets 
      require("luasnip.loaders.from_vscode").lazy_load({paths = { "./lua/snippets" }})

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
  	event = {
  	   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  	   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  	   "BufReadPre " .. vim.fn.expand "~/notes/**/*.md",
  	   "BufNewFile " .. vim.fn.expand "~/notes/**/*.md",
  	},
    keys = {
      { '<leader>nd', ':ObsidianToday<cr>', desc = 'obsidian [d]aily' },
      { '<leader>nt', ':ObsidianToday 1<cr>', desc = 'obsidian [t]omorrow' },
      { '<leader>ny', ':ObsidianToday -1<cr>', desc = 'obsidian [y]esterday' },
      { '<leader>nb', ':ObsidianBacklinks<cr>', desc = 'obsidian [b]acklinks' },
      { '<leader>nl', ':ObsidianLink<cr>', desc = 'obsidian [l]ink selection' },
      { '<leader>nf', ':ObsidianFollowLink<cr>', desc = 'obsidian [f]ollow link' },
      { '<leader>nn', ':ObsidianNew<cr>', desc = 'obsidian [n]ew' },
      { '<leader>ns', ':ObsidianSearch<cr>', desc = 'obsidian [s]earch' },
      { '<leader>no', ':ObsidianQuickSwitch<cr>', desc = 'obsidian [o]pen quickswitch' },
      { '<leader>nO', ':ObsidianOpen<cr>', desc = 'obsidian [O]pen in app' },
    },
  	dependencies = {
    	-- Required.
    	"nvim-lua/plenary.nvim",
  
    	-- see below for full list of optional dependencies 👇
  	},
  	config = function()
	    	require('obsidian').setup(require('config.plugins.obsidian'))
  	end
  },
}
