return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function() require("conform").format({ async = true, lsp_format = "fallback" }) end,
        mode = { "n", "x" },
        desc = "Format buffer or selection",
      },
    },
    opts = {
      default_format_opts = { lsp_format = "fallback" },
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        python = { "ruff_format", "black", stop_after_first = true },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        rust = { "rustfmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        sh = { "shfmt" },
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
        return { timeout_ms = 2000, lsp_format = "fallback" }
      end,
    },
    init = function()
      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, { desc = "Disable format-on-save", bang = true })
      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, { desc = "Enable format-on-save" })
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter search" },
    },
  },
  {
    "nvim-mini/mini.ai",
    version = false,
    event = "VeryLazy",
    opts = { n_lines = 500 },
  },
  {
    "nvim-mini/mini.surround",
    version = false,
    event = "VeryLazy",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = true },
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next TODO comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous TODO comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "TODOs (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Search TODOs" },
    },
  },
}
