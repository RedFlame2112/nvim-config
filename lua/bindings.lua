local opts = { noremap=true, silent=true }
-- lsp

local function set_keymaps(modes, key, command)
    for _, mode in ipairs(modes) do
        vim.api.nvim_set_keymap(mode, key, command, opts)
    end
end

-- for merging default opts with more fields (and description)
local function more(t1, t2)
    local result = {}
    for k, v in pairs(t1) do
        result[k] = v
    end
    for k, v in pairs(t2) do
        result[k] = v
    end
    return result
end


vim.api.nvim_set_keymap('n', '<leader>e','<cmd>lua vim.diagnostic.open_float()<CR>', more(opts, { desc = 'Open Diagnostics' }))
vim.api.nvim_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.declaration()<CR>', more(opts, { desc = 'Go to Declaration' }))
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', more(opts, { desc = 'Go to Definition' }))
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', more(opts, { desc = 'Hover over buffer' }))
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
vim.api.nvim_set_keymap('n', '<leader>ol', '<cmd>Workspace LeftPanelToggle<CR>', more(opts, { desc = 'Toggle Workspace Panel' }))
vim.api.nvim_set_keymap('n', '<leader>or', '<cmd>Workspace RightPanelToggle<CR>', more(opts, { desc = 'Toggle Git Panel' }))
vim.api.nvim_set_keymap('n', '<leader>ob', '<cmd>Workspace BottomPanelToggle<CR>', more(opts, { desc = 'Toggle Terminal Panel' }))
--Turn on Zenmode
vim.api.nvim_set_keymap('n', '<leader>z', '<cmd>ZenMode<CR>', opts)


--GPT backed interactive functionality
vim.api.nvim_set_keymap('n', '<F2>', '<cmd>ChatGPT<CR>', more(opts, { desc = 'GPT: Ask ChatGPT' }))
vim.api.nvim_set_keymap('n', '<F3>', '<cmd>ChatGPTActAs<CR>', more(opts, { desc = 'GPT: Act as' }))
vim.api.nvim_set_keymap('n', '<leader>rr', ':ChatGPTRun ', more(opts, { desc = 'GPT: Select Function' }))
--GPT Cmd functions can work in more than one mode. Either normal, visual or operator pending 
local gpt_modes = {'n', 'v', 'o'}
set_keymaps(gpt_modes, '<leader>rf', '<cmd>ChatGPTRun fix_bugs<CR>', more(opts, { desc = 'GPT: Fix Bugs' }))
set_keymaps(gpt_modes, '<leader>ra', '<cmd>ChatGPTRun add_tests<CR>', more(opts, { desc = 'GPT: Add Tests' }))
set_keymaps(gpt_modes, '<leader>rk', '<cmd>ChatGPTRun keywords<CR>', more(opts, { desc = 'GPT: Find Keywords' }))
set_keymaps(gpt_modes, '<leader>rd', '<cmd>ChatGPTRun docstring<CR>', more(opts, { desc = 'GPT: Add Docstring' }))
set_keymaps(gpt_modes, '<leader>re', '<cmd>ChatGPTRun explain_code<CR>', more(opts, { desc = 'GPT: Explain Code' }))
set_keymaps(gpt_modes, '<leader>rs', '<cmd>ChatGPTRun summarize<CR>', more(opts, { desc = 'GPT: Summarize Code' }))
set_keymaps(gpt_modes, '<leader>rc', '<cmd>ChatGPTCompleteCode<CR>', more(opts, { desc = 'GPT: Complete Code' }))
set_keymaps(gpt_modes, '<leader>ri', '<cmd>ChatGPTEditCodeWithInstructions<CR>', more(opts, { desc = 'GPT: Edit Code with Instructions' }))

vim.api.nvim_set_keymap('n', '<leader>T', '<cmd>TroubleToggle<CR>', more(opts, { desc = 'Toggle Trouble Diagnostics' }))
--Debugging 
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua require("dapui").toggle()<CR>', more(opts, { desc = 'DAP: Toggle UI' }))
vim.api.nvim_set_keymap('v', '<leader>de', '<cmd>lua require("dapui").eval()<CR>', more(opts, { desc = 'DAP: Evaluate expression' }))
