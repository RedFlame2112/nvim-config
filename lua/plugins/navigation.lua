return {
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
        on_attach = function()
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
}
