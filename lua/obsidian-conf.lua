return {
 workspaces = {
    {
      name = "notes",
      path = "~/notes",
    },
 },

  notes_subdir = "misc",
  log_level = vim.log.levels.INFO,
  -- completion of wiki links, local markdown links, and tags using nvim-cmp.
  completion = {
    -- Set to false to disable completion.
    nvim_cmp = true,
    -- Trigger completion at 2 chars.
    min_chars = 2,
  },
  -- To configure key mappings. These are the defaults. If you don't want to set any keymappings this
  -- way then set 'mappings = {}'.
  mappings = {
    -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
    ["<leader>gf"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    -- Toggle check-boxes.
    ['<leader>ch'] = {
      action = function()
        local line = vim.api.nvim_get_current_line()
        if line:match '%s*- %[' then
          require('obsidian').util.toggle_checkbox()
        elseif line:match '%s*-' then
          vim.cmd [[s/-/- [ ]/]]
          vim.cmd.nohlsearch()
        end
      end,
      opts = { buffer = true },
    },
  },
}
