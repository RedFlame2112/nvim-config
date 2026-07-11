local ui_opts = require("config.plugins.dap_ui")

local function mason_package(name)
  local ok, registry = pcall(require, "mason-registry")
  if not ok or not registry.has_package(name) then
    return nil
  end
  local package = registry.get_package(name)
  return package:is_installed() and package:get_install_path() or nil
end

local function configure_python()
  local debugpy = mason_package("debugpy")
  local python = debugpy and (debugpy .. "/venv/bin/python") or vim.fn.exepath("python3")
  require("dap-python").setup(python)
end

local function configure_go()
  require("dap-go").setup({
    delve = { path = vim.fn.exepath("dlv") ~= "" and vim.fn.exepath("dlv") or "dlv" },
  })
end

local function configure_rust(dap)
  local codelldb = mason_package("codelldb")
  local adapter = codelldb and (codelldb .. "/extension/adapter/codelldb") or vim.fn.exepath("codelldb")

  dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = { command = adapter ~= "" and adapter or "codelldb", args = { "--port", "${port}" } },
  }
  dap.configurations.rust = {
    {
      name = "Launch executable",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
    {
      name = "Attach to process",
      type = "codelldb",
      request = "attach",
      pid = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
  }
end

return function()
  local dap = require("dap")
  local dapui = require("dapui")

  dapui.setup(ui_opts)
  require("nvim-dap-virtual-text").setup({ commented = true })
  pcall(function() require("telescope").load_extension("dap") end)

  configure_python()
  configure_go()
  configure_rust(dap)

  dap.listeners.before.attach.dapui_config = dapui.open
  dap.listeners.before.launch.dapui_config = dapui.open
  dap.listeners.before.event_terminated.dapui_config = dapui.close
  dap.listeners.before.event_exited.dapui_config = dapui.close

  local signs = {
    DapBreakpoint = { text = "", texthl = "DiagnosticSignError" },
    DapBreakpointCondition = { text = "", texthl = "DiagnosticSignWarn" },
    DapLogPoint = { text = "󰛿", texthl = "DiagnosticSignInfo" },
    DapStopped = { text = "󰁕", texthl = "DiagnosticSignHint", linehl = "Visual" },
    DapBreakpointRejected = { text = "", texthl = "DiagnosticSignWarn" },
  }
  for name, sign in pairs(signs) do
    vim.fn.sign_define(name, sign)
  end
end
