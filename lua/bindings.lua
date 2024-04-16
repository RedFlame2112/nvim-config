local opts = { noremap=true, silent=true }

-- lsp
vim.api.nvim_set_keymap('n', '<space>e','<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '<c-D>', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-d>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-I>', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-u>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>n', ':NvimTreeFindFile<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-S>', '<cmd>lua require("spectre").toggle()<CR>', opts)
vim.api.nvim_set_keymap('n', ']t', '<cmd>Telescope<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-a>', '<cmd>Telescope live_grep<CR>', opts)

-- Use nvim_create_autocmd to set the keymap ']c' only for LaTeX files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function()
        vim.api.nvim_set_keymap('n', ']c', '<cmd>VimtexCompile<CR>', opts)
    end,
})

-- Snippet keymaps
vim.api.nvim_set_keymap('i', '<S-Tab>', "<cmd>lua require'luasnip'.jump(-1)<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap('i', '<Tab>', "<cmd>lua require('luasnip').jump(1)<CR>", {silent = true, expr = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', "<cmd>lua require('luasnip').jump(-1)<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap('i', '<Tab>', "v:lua.require'luasnip'.expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'", {silent = true, expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<C-E>', "v:lua.require'luasnip'.choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", {silent = true, expr = true})
vim.api.nvim_set_keymap('s', '<C-E>', "v:lua.require'luasnip'.choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'", {silent = true, expr = true})
--make a keymap for toggling Left, Bottom, Right panels with Workspace LeftPanelToggle, RightPanelToggle, BottomPanelToggle
vim.api.nvim_set_keymap('n', '<C-o><C-l>', '<cmd>Workspace LeftPanelToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-o><C-r>', '<cmd>Workspace RightPanelToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-o><C-b>', '<cmd>Workspace BottomPanelToggle<CR>', opts)


--GPT backed interactive functionality
vim.api.nvim_set_keymap('n', '<F2>', '<cmd>ChatGPT<CR>', opts)
vim.api.nvim_set_keymap('n', '<F3>', '<cmd>ChatGPTActAs<CR>', opts)
vim.api.nvim_set_keymap('n', ',r', ':ChatGPTRun ', {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', ',rf', '<cmd>ChatGPTRun fix_bugs<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', ',ra', '<cmd>ChatGPTRun add_tests<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', ',rk', '<cmd>ChatGPTRun keywords<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', ',rd', '<cmd>ChatGPTRun docstring<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', ',re', '<cmd>ChatGPTRun explain_code<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', ',rs', '<cmd>ChatGPTRun summarize<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', ',rc', '<cmd>ChatGPTCompleteCode<CR>', {silent = true, noremap = true})

--Debugging 
vim.api.nvim_set_keymap('n', ',d', '<cmd>lua require("dapui").toggle()<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', ',de', '<cmd>lua require("dapui").eval()<CR>', {silent = true, noremap = true})
