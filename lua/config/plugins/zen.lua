return {
  window = {
    backdrop = 0.9,
    height = 0.95,
    options = {
      cursorline = false,
      number = false,
    },
  },
 
  plugins = {
    options = {
      enabled = true,
      ruler = true, -- disables the ruler text in the cmd line area
      showcmd = true, -- disables the command in the last line of the screen
      -- you may turn on/off statusline in zen mode by setting 'laststatus' 
      -- statusline will be shown only if 'laststatus' == 3
      laststatus = 0, -- turn off the statusline in zen mode
    },

    kitty = {
      enabled = true,
      font = "+4", -- font size
    },
 
    tmux = { 
      enabled = true,
    },
    gitsigns = {
      enabled = true,
    },
  },
}  
