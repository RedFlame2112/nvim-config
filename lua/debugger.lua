OPTS = require('dap-ui-opts')

return function(_, OPTS)
  local dap, dapui = require('dap'), require('dapui')
  dapui.setup(OPTS)

  dap.listeners.before.attach.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
  end

  dap.adapters.python = function(cb, config)
    if config.request == 'attach' then
      local port = (config.connect or config).port
      local host = (config.connect or config).host or '127.0.0.1'
      cb({ 
          type = 'server', 
          host = host, 
          port = assert(port, 
            "no port number specified, port is needed for python `attach` configuration"
          ),
          options = { source_filetype = 'python' },
      })
    else 
      cb({
        type = 'executable',
        command = "~/dbg/venv/python3",
        args = {"-m", "debugpy.adapter"},
        options = { source_filetype = 'python' },
      })
    end
  end

  dap.configurations.python = {
    {
      type = 'python',
      request = 'launch',
      name = 'Debug (base)',
      program = '${file}',
      pythonPath = function()
        return '/usr/bin/python3'
      end,
    },
  }

end
