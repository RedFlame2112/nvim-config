return function()
  local harpoon = require('harpoon')
  harpoon:setup({})
  local conf = require("telescope.config").values
  local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
      end
  
      require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
              results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
      }):find()
  end

  --for dashboard
  _G.toggle_telescope_from_harpoon = function()
    local harpoon = require('harpoon')
    toggle_telescope(harpoon:list())
  end

  vim.keymap.set("n", "<leader>h", function() toggle_telescope(harpoon:list()) end,
    { desc = "[Harpoon] Open window" })
  vim.keymap.set("n", "<space>la", function() harpoon:list():add() end,
    { desc = "[Harpoon] Add harpoon buffer" })
  vim.keymap.set("n", "<space>ld", function() harpoon:list():remove() end,
    { desc = "[Harpoon] Remove harpoon buffer" })
  vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
  vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
  vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
  vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
  --Toggle between harpoon buffers
  vim.keymap.set("n", "<leader>bp", function() harpoon:list():prev() end,
    { desc = "[Harpoon] Toggle previous" })
  vim.keymap.set("n", "<leader>bn", function() harpoon:list():next() end,
    { desc = "[Harpoon] Toggle next" })

  --For dashboard 
  
end
