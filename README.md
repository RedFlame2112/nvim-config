# Neovim IDE

This build of neovim is intended to give user the power of an ide-like experience in their terminals.
Dashboard uses VSCode logo for fun ;)

### Useful features

* Lazy load(1.5x times faster than packer)
* LSP support for go, c, rust, python, json, js, verilog, etc
* Terminal, file explorer
* Dashboard
* Rainbow indents
* Git signs
* In file and fuzzy search(ripgrep is needed)
* LeetCode integration for solving leetcode problems
* Snippets engine for automatic code completion
* Intellisense and code completion with nvim-cmp
* LLM based support with inbuilt GPT prompt reader (need GPT api key)
* Automatic code generation with Codeium
* VimTeX keybindings, snippets, and full support for writing papers, completing homework assignments, etc.
* Smooth, lossless note taking with Obsidian
* (Experimental) Dropbar support for documentation and buffer navigation
* Buffer management, finder, and navigator with Harpoon
* Zen mode for focused, undistracted coding

![Screenshot1](https://github.com/RedFlame2112/nvim-config/blob/master/src/s1.png)
![Screenshot4](https://github.com/RedFlame2112/nvim-config/blob/master/src/s4.png)
![Screenshot5](https://github.com/RedFlame2112/nvim-config/blob/master/src/s5.png)
![Screenshot6](https://github.com/RedFlame2112/nvim-config/blob/master/src/s6.png)

### Some shortcuts:
  * Ctrl+t - toggle terminal
  * Ctrl+n - toggle file tree
  * Ctrl+f - toggle Telescope 
  * Ctrl+a - toggle live grep search
  * Ctrl+s - toggle search field
  * ZZ - in case you don't know how to exit vim
  * Esc - to exit telescope
  * Ctrl+u - rename function/variable/class/etc... using lsp
  * Ctrl+p - view references
  * Ctrl+i - go to implementation
  * Ctrl+d - go to definition
  * Ctrl+D - go to declaration
  * ]+d - lsp diagnostic
  * K - hover using lsp
  * F2 - ChatGPT prompt (needs api key)
  * ,+o+r - Open Git diagnostics
  * ,+o+l - Open Workspace details
  * ,r - ChatGPT running command tree

You can find more details about keybinds through Which-key.nvim
