local opts = { noremap=true, silent=true }
-- lsp
vim.api.nvim_set_keymap('n', '<leader>e','<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '<c-D>', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-d>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-I>', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
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
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>Telescope<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-a>', '<cmd>Telescope live_grep<CR>', opts)

-- Set the keymap '<leader>c' only for LaTeX files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function()
        vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>VimtexCompile<CR>', opts)
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
vim.api.nvim_set_keymap('n', '<leader>ol', '<cmd>Workspace LeftPanelToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>or', '<cmd>Workspace RightPanelToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>ob', '<cmd>Workspace BottomPanelToggle<CR>', opts)
--Turn on Zenmode
vim.api.nvim_set_keymap('n', '<C-m>', '<cmd>ZenMode<CR>', opts)

--GPT backed interactive functionality
vim.api.nvim_set_keymap('n', '<F2>', '<cmd>ChatGPT<CR>', opts)
vim.api.nvim_set_keymap('n', '<F3>', '<cmd>ChatGPTActAs<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>rr', ':ChatGPTRun ', {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', '<leader>rf', '<cmd>ChatGPTRun fix_bugs<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', '<leader>ra', '<cmd>ChatGPTRun add_tests<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', '<leader>rk', '<cmd>ChatGPTRun keywords<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', '<leader>rd', '<cmd>ChatGPTRun docstring<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', '<leader>re', '<cmd>ChatGPTRun explain_code<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', '<leader>rs', '<cmd>ChatGPTRun summarize<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', '<leader>rc', '<cmd>ChatGPTCompleteCode<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<leader>tt', '<cmd>TroubleToggle<CR>', {silent = true, noremap = true})
--Debugging 
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua require("dapui").toggle()<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('v', '<leader>de', '<cmd>lua require("dapui").eval()<CR>', {silent = true, noremap = true})
