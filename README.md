# Silver Wolf Neovim

A Neovim 0.12 configuration built around a neon Silver Wolf theme, native LSP, repository-aware Codex completions, and Lazy.nvim.

## Layout

```text
init.lua                    Bootstrap Lazy and load core configuration
lua/config/                 Editor options, keymaps, LSP, and theme
lua/config/plugins/         Larger setup modules for individual plugins
lua/plugins/                Lazy plugin specs grouped by purpose
lua/codex/                  Codex-backed editor workflows
lua/palettes/               Shared Silver Wolf color palette
lua/snippets/               Custom snippets
```

Lazy imports every module under `lua/plugins/`. To add a plugin, place its spec in the closest existing category or create another category file; no central plugin list needs updating.

Current plugin categories:

- `ai.lua` — Codeium and legacy ChatGPT integration
- `coding.lua` — completion, LSP, language tooling, and Git signs
- `navigation.lua` — fuzzy finding, bookmarks, and color previews
- `qol.lua` — formatting, fast jumps, text objects, surrounds, and TODOs
- `tools.lua` — Mason, notifications, diagnostics, and utility interfaces
- `ui.lua` — theme, dashboard, statusline, explorer, and syntax UI
- `workflow.lua` — debugging, testing, Harpoon, which-key, and Zen mode
- `writing.lua` — snippets, Obsidian, LaTeX, and Typst

## Useful mappings

Press `<leader>` (comma) and wait for which-key to discover the full mapping tree.

| Mapping | Action |
| --- | --- |
| `<C-n>` | Toggle file explorer |
| `<C-t>` | Toggle terminal |
| `<leader>ts` | Search project text |
| `gd` / `gr` | Definition / references |
| `<leader>ca` | LSP code action |
| `<leader>cf` | Format buffer or selection (external formatter, then LSP fallback) |
| `s` / `S` | Flash jump / syntax-aware Flash jump |
| `gsa` / `gsd` / `gsr` | Add / delete / replace surroundings |
| `]t` / `[t` | Next / previous TODO comment |
| `<S-h>` / `<S-l>` | Previous / next buffer |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>du` | Toggle debugger UI |
| `<leader>dc` | Start or continue debugging |
| `<leader>db` | Toggle breakpoint |
| `<leader>do` / `<leader>di` / `<leader>dO` | Step over / into / out |
| `<leader>dg` | Debug nearest Go test |
| `<leader>dp` | Debug nearest Python test |
| `<leader>dj` | Debug nearest Java test |
| `<leader>ai` | Complete a comment or selection with Codex |
| `<leader>ap` | Enter an inline Codex prompt |

For Codex completion, place the cursor on a natural-language comment and press `<leader>ai`. Codex runs asynchronously with read-only repository access and inserts the generated code below the instruction.

## Requirements

- Neovim 0.12+
- Git and ripgrep
- A Nerd Font
- Language servers used by your projects
- The Codex CLI authenticated with `codex login` for inline Codex completion

## Debugging

The DAP UI opens automatically when a session starts and closes when it exits. Mason installs the required adapters:

- Go — Delve
- Python — debugpy, including pytest method debugging
- Rust — CodeLLDB launch and process-attach configurations
- Java — eclipse.jdt.ls with the Microsoft Java debugger and Java test bundles

Java language tooling runs on the installed JDK 21 while projects may target a different configured JDK. Project-specific `.vscode/launch.json` files are also recognized by nvim-dap.
