return function()
  local colors = require("palettes").get_palette()
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  local border = "rounded"
  local servers = {
    clangd = {},
    gopls = {
      cmd = { "gopls", "serve" },
      settings = {
        gopls = {
          analyses = { unusedparams = true },
          staticcheck = true,
        },
      },
    },
    rust_analyzer = {},
    lua_ls = {
      settings = {
        Lua = {
          completion = { callSnippet = "Replace" },
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
        },
      },
    },
    html = {},
    ts_ls = {},
    pyright = {},
    jsonls = {},
    verible = { cmd = { "verible-verilog-ls", "--rules_config_search" } },
  }

  for name, config in pairs(servers) do
    config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
    vim.lsp.config(name, config)
    vim.lsp.enable(name)
  end

  vim.diagnostic.config({
    severity_sort = true,
    update_in_insert = false,
    underline = true,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.INFO] = " ",
        [vim.diagnostic.severity.HINT] = "󰌵 ",
      },
    },
    virtual_text = { spacing = 3, source = "if_many", prefix = "●" },
    float = { border = border, source = true },
  })

  local float_group = vim.api.nvim_create_augroup("SilverWolfLspFloats", { clear = true })
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = float_group,
    callback = function()
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.surface0, fg = colors.text })
      vim.api.nvim_set_hl(0, "FloatBorder", { bg = colors.surface0, fg = colors.pink })
    end,
  })

  local format_group = vim.api.nvim_create_augroup("SilverWolfFormat", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = format_group,
    pattern = { "*.go", "*.c", "*.h", "*.rs", "*.ts", "*.tsx", "*.js", "*.jsx", "*.v", "*.sv" },
    callback = function(args)
      vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 2000 })
    end,
  })

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("SilverWolfLspKeys", { clear = true }),
    callback = function(args)
      local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = "LSP: " .. desc })
      end
      map("gd", vim.lsp.buf.definition, "Go to definition")
      map("gD", vim.lsp.buf.declaration, "Go to declaration")
      map("gr", vim.lsp.buf.references, "References")
      map("gI", vim.lsp.buf.implementation, "Go to implementation")
      map("K", function() vim.lsp.buf.hover({ border = border }) end, "Hover documentation")
      map("<leader>cr", vim.lsp.buf.rename, "Rename")
      map("<leader>ca", vim.lsp.buf.code_action, "Code action")
      map("<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format")
    end,
  })
end
