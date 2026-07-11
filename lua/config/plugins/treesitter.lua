return {
  -- A list of parser names, or "all"
  ensure_installed = {
    "c",
    "css",
    "go",
    "html",
    "java",
    "javascript",
    "json",
    "lua",
    "python",
    "rust",
    "scss",
    "typescript",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil
  },
  indent = {
    enable = true,
    disable = {}
  },
  autotag = {
    enable = true
  },
}
