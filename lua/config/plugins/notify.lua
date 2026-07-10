local nvim_notify = require("notify")
local colors = require("palettes").get_palette()

nvim_notify.setup {
  -- Animation style
  stages = "slide",
  -- Default timeout for notifications
  timeout = 3500,
  background_colour = colors.surface0,
}

vim.notify = nvim_notify
