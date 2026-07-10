local M = {}

local running = false

local function project_root(file)
  return vim.fs.root(file, { ".git", "AGENTS.md", "pyproject.toml", "package.json", "Cargo.toml", "go.mod" })
    or vim.fn.getcwd()
end

local function selection(buf)
  local start_row = vim.fn.line("'<")
  local end_row = vim.fn.line("'>")
  if start_row < 1 or end_row < start_row then
    return nil
  end
  return table.concat(vim.api.nvim_buf_get_lines(buf, start_row - 1, end_row, false), "\n"), end_row
end

local function clean_response(response)
  response = vim.trim(response or "")
  response = response:gsub("^```[%w_+.-]*%s*\n", ""):gsub("\n```%s*$", "")
  return vim.split(response, "\n", { plain = true })
end

local function run(instruction, insert_after)
  if running then
    vim.notify("A Codex inline request is already running", vim.log.levels.WARN)
    return
  end

  local buf = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(buf)
  local root = project_root(file)
  local tick = vim.api.nvim_buf_get_changedtick(buf)
  local output = vim.fn.tempname()
  local first = math.max(0, insert_after - 81)
  local last = math.min(vim.api.nvim_buf_line_count(buf), insert_after + 80)
  local context = table.concat(vim.api.nvim_buf_get_lines(buf, first, last, false), "\n")
  local file_label = file ~= "" and (vim.fs.relpath(root, file) or file) or "[unsaved buffer]"

  local prompt = table.concat({
    "You are providing an inline code completion for Neovim.",
    "Inspect the repository when useful, but do not edit any files or run mutating commands.",
    "Return only the code to insert: no Markdown fences, explanation, preamble, or diff.",
    "Match the surrounding language, indentation, style, and existing APIs.",
    "The user's natural-language instruction is:",
    instruction,
    "",
    "File: " .. file_label,
    string.format("Context around line %d:", insert_after),
    context,
  }, "\n")

  running = true
  vim.notify("Codex is generating an inline completion…", vim.log.levels.INFO, { title = "Codex" })

  vim.system({
    "codex", "-a", "never", "exec",
    "--sandbox", "read-only",
    "--ephemeral",
    "--skip-git-repo-check",
    "-C", root,
    "--output-last-message", output,
    "-",
  }, { stdin = prompt, text = true }, function(result)
    vim.schedule(function()
      running = false
      local response = vim.fn.filereadable(output) == 1 and table.concat(vim.fn.readfile(output), "\n") or ""
      vim.fn.delete(output)

      if result.code ~= 0 then
        local err = vim.trim(result.stderr or "")
        vim.notify(err ~= "" and err or "Codex exited without a completion", vim.log.levels.ERROR, { title = "Codex" })
        return
      end
      if not vim.api.nvim_buf_is_valid(buf) or vim.api.nvim_buf_get_changedtick(buf) ~= tick then
        vim.notify("Buffer changed while Codex was working; completion was not inserted", vim.log.levels.WARN, { title = "Codex" })
        return
      end

      local lines = clean_response(response)
      if #lines == 0 or (#lines == 1 and lines[1] == "") then
        vim.notify("Codex returned an empty completion", vim.log.levels.WARN, { title = "Codex" })
        return
      end

      vim.api.nvim_buf_set_lines(buf, insert_after, insert_after, false, lines)
      vim.api.nvim_win_set_cursor(0, { insert_after + #lines, 0 })
      vim.notify("Inline completion inserted", vim.log.levels.INFO, { title = "Codex" })
    end)
  end)
end

function M.inline(mode)
  local buf = vim.api.nvim_get_current_buf()
  if mode == "visual" then
    local text, end_row = selection(buf)
    if text then
      run(text, end_row)
    end
    return
  end

  local row = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.api.nvim_get_current_line()
  if vim.trim(line) == "" then
    vim.ui.input({ prompt = "Codex instruction: " }, function(input)
      if input and vim.trim(input) ~= "" then
        run(input, row)
      end
    end)
  else
    run(line, row)
  end
end

function M.prompt()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.ui.input({ prompt = "Codex instruction: " }, function(input)
    if input and vim.trim(input) ~= "" then
      run(input, row)
    end
  end)
end

return M
