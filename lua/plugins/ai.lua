local GPT_WELCOME_MESSAGE = [[

        /\\
       /  \\
      /\\   \\
     /  __  \\     I use Arch btw
    /  (  )  \\
   / __|  |__\\\\
  /.`        `.\\

]]

return {
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
}
