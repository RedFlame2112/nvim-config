local map = vim.keymap.set

local function command(lhs, rhs, desc, mode)
  map(mode or "n", lhs, "<cmd>" .. rhs .. "<cr>", { desc = desc, silent = true })
end

-- Everyday editing
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
map("n", "<leader>w", "<cmd>update<cr>", { desc = "Write buffer", silent = true })
map("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit window", silent = true })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer", silent = true })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer", silent = true })
map("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Focus lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Focus upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })
map("x", "<", "<gv", { desc = "Indent and reselect" })
map("x", ">", ">gv", { desc = "Indent and reselect" })
map("x", "J", ":move '>+1<cr>gv=gv", { desc = "Move selection down", silent = true })
map("x", "K", ":move '<-2<cr>gv=gv", { desc = "Move selection up", silent = true })
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Diagnostics and navigation
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostics" })
map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "Previous diagnostic" })
map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "Next diagnostic" })
command("<C-n>", "NvimTreeToggle", "Toggle file explorer")
command("<leader>n", "NvimTreeFindFile", "Reveal file in explorer")
command("<C-S>", 'lua require("spectre").toggle()', "Toggle search and replace")
command("<C-S>", 'lua require("spectre").visual()', "Search selected text", "x")

-- Pickers and panels
command("<leader>tt", "Telescope", "Open Telescope")
command("<leader>ts", "Telescope live_grep", "Search project text")
command("<leader>ta", "Telescope autocommands", "Find autocommands")
command("<leader>th", "Telescope highlights", "Inspect highlights")
command("<leader>si", "Mason", "Manage language tools")
command("<leader>ss", "LspStart", "Start LSP")
command("<leader>se", "LspStop", "Stop LSP")
command("<leader>ol", "NvimTreeToggle", "Toggle file explorer")
command("<leader>or", "DiffviewOpen", "Open Git diff view")
command("<leader>ob", "ToggleTerm", "Toggle terminal")
command("<leader>z", "ZenMode", "Toggle Zen mode")

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("SilverWolfFiletypeKeys", { clear = true }),
  pattern = "tex",
  callback = function(args)
    map("n", "<leader>c", "<cmd>VimtexCompile<cr>", {
      buffer = args.buf,
      desc = "Compile LaTeX",
      silent = true,
    })
  end,
})

-- Snippets
map({ "i", "s" }, "<Tab>", function()
  local ok, luasnip = pcall(require, "luasnip")
  if ok and luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
    return ""
  end
  return "\t"
end, { expr = true, desc = "Expand or advance snippet" })
map({ "i", "s" }, "<S-Tab>", function()
  local ok, luasnip = pcall(require, "luasnip")
  if ok and luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { desc = "Previous snippet field" })
map({ "i", "s" }, "<C-e>", function()
  local ok, luasnip = pcall(require, "luasnip")
  if ok and luasnip.choice_active() then
    luasnip.change_choice(1)
  end
end, { desc = "Next snippet choice" })

-- Legacy ChatGPT actions
command("<F2>", "ChatGPT", "GPT: Ask ChatGPT")
command("<F3>", "ChatGPTActAs", "GPT: Act as")
map("n", "<leader>rr", ":ChatGPTRun ", { desc = "GPT: Select action" })
local gpt_modes = { "n", "x", "o" }
command("<leader>rf", "ChatGPTRun fix_bugs", "GPT: Fix bugs", gpt_modes)
command("<leader>ra", "ChatGPTRun add_tests", "GPT: Add tests", gpt_modes)
command("<leader>rk", "ChatGPTRun keywords", "GPT: Find keywords", gpt_modes)
command("<leader>rd", "ChatGPTRun docstring", "GPT: Add docstring", gpt_modes)
command("<leader>re", "ChatGPTRun explain_code", "GPT: Explain code", gpt_modes)
command("<leader>rs", "ChatGPTRun summarize", "GPT: Summarize code", gpt_modes)
command("<leader>rc", "ChatGPTCompleteCode", "GPT: Complete code", gpt_modes)
command("<leader>ri", "ChatGPTEditWithInstructions", "GPT: Edit with instructions", gpt_modes)

-- Repository-aware Codex completions
map("n", "<leader>ai", function() require("codex.inline").inline() end, { desc = "Codex: Complete instruction" })
map("x", "<leader>ai", function() require("codex.inline").inline("visual") end, { desc = "Codex: Complete selection" })
map("n", "<leader>ap", function() require("codex.inline").prompt() end, { desc = "Codex: Prompt inline" })

-- Debugging and Harpoon
command("<leader>dc", 'lua require("dap").continue()', "DAP: Start / continue")
command("<leader>db", 'lua require("dap").toggle_breakpoint()', "DAP: Toggle breakpoint")
map("n", "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP: Conditional breakpoint" })
command("<leader>do", 'lua require("dap").step_over()', "DAP: Step over")
command("<leader>di", 'lua require("dap").step_into()', "DAP: Step into")
command("<leader>dO", 'lua require("dap").step_out()', "DAP: Step out")
command("<leader>dr", 'lua require("dap").repl.open()', "DAP: Open REPL")
command("<leader>dl", 'lua require("dap").run_last()', "DAP: Run last")
command("<leader>dt", 'lua require("dap").terminate()', "DAP: Terminate")
command("<leader>du", 'lua require("dapui").toggle()', "DAP: Toggle UI")
command("<leader>de", 'lua require("dapui").eval()', "DAP: Evaluate expression", "x")
command("<leader>dg", 'lua require("dap-go").debug_test()', "DAP: Debug nearest Go test")
map("n", "<leader>dp", function()
  local file = vim.api.nvim_buf_get_name(0)
  local root = vim.fs.root(file, { "pyproject.toml", "pytest.ini", "setup.cfg", "setup.py" })
    or vim.fs.dirname(file)
  local previous = vim.fn.getcwd(0)

  vim.cmd.lcd(vim.fn.fnameescape(root))
  require("dap-python").test_method({ config = { cwd = root } })
  vim.cmd.lcd(vim.fn.fnameescape(previous))
end, { desc = "DAP: Debug nearest Python test" })
command("<leader>dj", 'lua require("jdtls").test_nearest_method()', "DAP: Debug nearest Java test")
command("<leader>la", 'lua require("harpoon"):list():add()', "Harpoon: Add file")
command("<leader>ld", 'lua require("harpoon"):list():remove()', "Harpoon: Remove file")
for index = 1, 4 do
  local slot = index
  map("n", "<leader>" .. slot, function() require("harpoon"):list():select(slot) end, { desc = "Harpoon: File " .. slot })
end
map("n", "<leader>bp", function() require("harpoon"):list():prev() end, { desc = "Harpoon: Previous" })
map("n", "<leader>bn", function() require("harpoon"):list():next() end, { desc = "Harpoon: Next" })
