local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = "number"
opt.signcolumn = "yes"
opt.wrap = false
opt.linebreak = true
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.termguicolors = true
opt.laststatus = 3
opt.showmode = false
opt.showtabline = 2
opt.cmdheight = 0
opt.pumheight = 12
opt.winborder = "rounded"

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.inccommand = "split"
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true

opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.confirm = true
opt.updatetime = 200
opt.timeoutlen = 300
opt.completeopt = { "menu", "menuone", "noselect" }
opt.conceallevel = 1
opt.fileencoding = "utf-8"
opt.whichwrap = "b,s,<,>,[,],h,l"
opt.shortmess:append("Ic")

vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins = 1

if vim.uv.fs_stat("/usr/share/dict/words") then
  opt.dictionary:append("/usr/share/dict/words")
end
