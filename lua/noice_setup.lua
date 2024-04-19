
return function()
  local noice = require("noice")
  noice.setup({
    lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
   },
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    cmdline = {
      format = {
        search_down = {
          view = "cmdline",
          pattern = "^/",
          icon = ':',
          lang = 'regex',
        },
        search_up = {
          view = "cmdline",
          pattern = "^%?",
          lang = 'regex',
        },
        cmdline = {
          pattern = "^:",
          icon = "λ",
          lang = "vim"
        },
        filter = {
          pattern = "^:%s*!",
          icon = "$",
          lang = "bash"
        },
      },
    },
    routes = {
      {
        filter = {
          kind = "search_count",
          event = { "msg_showmode", "msg_show" },
        },
        opts = { skip = true },
        view = "notify",
      },
    },
    messages = {
      enabled = true,
      view = "notify",
      view_error = "notify", -- view for errors
      view_warn = "notify", -- view for warnings
      view_history = "messages", -- view for :messages
      view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
    },
    views = {
      cmdline_popup = {
        position = {
          row = 5,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 8,
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
        },
      },
    },
  })
end
